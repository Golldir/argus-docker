from sqlalchemy.orm import relationship

from backend.db import Base
from sqlalchemy import Column, Integer, String, ForeignKey # New

class MnemonicScheme(Base):
    __tablename__ = 'mnemonicschemes'
    id = Column(Integer, primary_key=True)
    image = Column(String)
    slug = Column(String, unique=True, index=True)
    navmenu_name = Column(String, unique=True)
    server_id = Column(Integer, ForeignKey('smbservers.id'), nullable=True)

    sensors = relationship('Sensor', back_populates='scheme')
    smbserver = relationship('SMBServer', back_populates='scheme')

