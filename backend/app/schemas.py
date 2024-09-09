from pydantic import BaseModel


class TodoBase(BaseModel):
    title: str
    description: str | None = None


class TodoCreate(TodoBase):
    pass

class TodoUpdate(TodoBase):
    done: bool

class Todo(TodoBase):
    id: int
    owner_id: int
    done: bool

    class Config:
        orm_mode = True


class UserBase(BaseModel):
    email: str


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int
    is_active: bool
    todos: list[Todo] = []

    class Config:
        orm_mode = True
