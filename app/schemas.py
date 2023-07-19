from pydantic import BaseModel


class ToDo(BaseModel):
    task: str
    id: int

    class Config:
        from_attributes = True


class ToDoCreate(BaseModel):
    task: str
