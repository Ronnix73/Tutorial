from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Create Engine
engine = create_engine("postgresql+psycopg2://postgres:test@db:5432/todooo.db")

# Create DeclarativeBase
Base = declarative_base()

SessionLocal = sessionmaker(bind=engine, expire_on_commit=False)
