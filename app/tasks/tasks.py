from io import BytesIO, TextIOWrapper
from typing import Annotated

from fastapi import Depends
from smb.SMBConnection import SMBConnection


from sqlalchemy import select, bindparam, update, values
from sqlalchemy.ext.asyncio import AsyncSession


from backend.db_depends import get_db
from models import SMBServer, Sensor
from .tkq import broker


@broker.task(
    schedule=[{"cron": "* * * * *"}]
    # max_retries=3,
    # retry_on_exception=True,
)
async def schedule_test_task(
        db: Annotated[AsyncSession, Depends(get_db)]
):
    smb_servers = await db.scalars(select(SMBServer))
    sensors_to_update = []

    for smb_server in smb_servers.all():
        print(f'[ INFO ][ ------------------------ ПОПЫТКА ПОДКЛЮЧЕНИЯ К {smb_server.server_name} ------------------------ ]')
        smb_server_data = {
            "id": smb_server.id,
            "server_ip": smb_server.server_ip,
            "server_name": smb_server.server_name,
            "shared_folder_name": smb_server.shared_folder_name,
            "file_name": smb_server.file_name,
            "server_availability": smb_server.server_availability,
        }

        result = check_server_availability(smb_server_data)

        if result:
            sensors_to_update.extend(result)
            await db.execute(
                update(SMBServer)
                .where(SMBServer.id == smb_server.id).
                values(server_availability=True)
            )
            print(f'[ INFO ][ ------------------------ УДАЧНАЯ ПОПЫТКА ПОДКЛЮЧЕНИЯ К {smb_server.server_name} ------------------------ ]')
        else:
            await db.execute(
                update(SMBServer).
                where(SMBServer.id == smb_server.id).
                values(server_availability=False)
            )
            print(f'[ INFO ][ ------------------------ НЕУДАЧНАЯ ПОПЫТКА ПОДКЛЮЧЕНИЯ К {smb_server.server_name} ------------------------ ]')

        if sensors_to_update:
            conn = await db.connection()
            await conn.execute(
                update(Sensor)
                .where(Sensor.code == bindparam("b_code"))
                .execution_options(synchronize_session=False)
                ,sensors_to_update)

        await db.commit()

    return sensors_to_update



def check_server_availability(smb_server):
    server_name = smb_server['server_name']  # Полный smb-путь
    server_ip = smb_server['server_ip']  # IP-адрес SMB-сервера
    shared_folder_name = smb_server['shared_folder_name']  # Название расшаренной папки
    file_name = smb_server['file_name']  # Путь к файлу внутри расшаренной папки
    user_name = ''  # Имя пользователя (для анонимного доступа оставить любым)
    password = ''  # Пароль (для анонимного доступа оставить любым)
    client_name = ''  # Имя клиента (можно оставить как 'client', для анонимного
    # доступа оставить любым)
    sensors_dict = []
    with SMBConnection(user_name, password, client_name, server_name, use_ntlm_v2=True) as conn:
        try:
            if conn.connect(ip=server_ip, timeout=0.5):
                file_obj = BytesIO()
                conn.retrieveFile(shared_folder_name, file_name, file_obj)
                file_obj.seek(0)

                for i in TextIOWrapper(file_obj, encoding='utf-8'):
                    key, value = i.split('=')
                    value = str(round(float(value.strip()), 2))

                    sensors_dict.append({"b_code": key, "current_value": value})

        except:
            return

    return sensors_dict
