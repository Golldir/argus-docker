from sqlalchemy.orm import relationship

from backend.db import Base
from sqlalchemy import Column, Integer, String, Boolean, ForeignKey # New

class Sensor(Base):
    __tablename__ = 'sensors'
    id = Column(Integer, primary_key=True)
    code = Column(String, unique=True)
    pos_x = Column(String)
    pos_y = Column(String)
    color = Column(String)
    units = Column(String)
    current_value = Column(String)
    center = Column(Boolean)
    line_breaks = Column(Boolean)
    scheme_slug = Column(String, ForeignKey('mnemonicschemes.slug'), nullable=True)

    scheme = relationship('MnemonicScheme', back_populates='sensors')
