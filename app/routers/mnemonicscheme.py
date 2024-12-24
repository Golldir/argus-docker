from fastapi import APIRouter, Depends, status, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from typing import Annotated
from sqlalchemy import select

from backend.db_depends import get_db
from models import SMBServer
from models.sensor import Sensor
from models.mnemonicscheme import MnemonicScheme
router = APIRouter(tags=[''])

@router.get('/menu')
async def get_navmenu(db: Annotated[AsyncSession, Depends(get_db)]):

    query = (select(MnemonicScheme.slug, MnemonicScheme.navmenu_name, SMBServer.server_availability)
             .join(SMBServer, MnemonicScheme.server_id == SMBServer.id)
             .order_by(MnemonicScheme.id))

    result = await db.execute(query)

    return result.mappings().all()

@router.get('/{scheme_slug}')
async def get_selected_scheme(db: Annotated[AsyncSession, Depends(get_db)], scheme_slug: str):

    mnemonicscheme = await db.scalar(
        select(MnemonicScheme)
        .where(MnemonicScheme.slug == scheme_slug)
    )

    if not mnemonicscheme:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail='Требуемой схемы не обнаружено'
        )

    return mnemonicscheme


@router.get('/{scheme_slug}/sensors')
async def get_sensors_by_scheme(db: Annotated[AsyncSession, Depends(get_db)], scheme_slug: str):

    # Запрос всех датчиков, привязанных к конкретной схеме
    result = await db.scalars(
        select(Sensor)
        .where(Sensor.scheme_slug == scheme_slug)
    )
    sensors = result.all()

    if not sensors:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail='Требуемых датчиков не обнаружено'
        )

    return sensors


# @router.get('/test/test')
# async def get_test(db: Annotated[AsyncSession, Depends(get_db)]):
#     await schedule_test_task(db)


