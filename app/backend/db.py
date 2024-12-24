from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from sqlalchemy.orm import sessionmaker, DeclarativeBase  # New

from settings import DEBUG

if DEBUG:
    psql = 'localhost'
else:
    psql = 'db'


engine = create_async_engine(f'postgresql+asyncpg://argus:1234@{psql}:5432/argusdb', echo=True)
async_session_maker = async_sessionmaker(engine, expire_on_commit=False, class_=AsyncSession)

class Base(DeclarativeBase):  # New
    pass
