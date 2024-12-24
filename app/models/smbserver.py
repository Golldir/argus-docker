from sqlalchemy.orm import relationship

from backend.db import Base
from sqlalchemy import Column, Integer, String, Boolean, ForeignKey # New

class SMBServer(Base):
    __tablename__ = 'smbservers'
    id = Column(Integer, primary_key=True, autoincrement=True)
    server_ip = Column(String)
    server_name = Column(String, unique=True)
    shared_folder_name = Column(String)
    file_name = Column(String)
    server_availability = Column(Boolean)

    scheme = relationship('MnemonicScheme', back_populates='smbserver')
