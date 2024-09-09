from fastapi import Depends, FastAPI, HTTPException, Request, Response
from sqlalchemy.orm import Session
from prometheus_fastapi_instrumentator import Instrumentator

# from . import crud, models, schemas
from .database import SessionLocal, engine
from .routers import users
from .dependencies import get_db

# models.Base.metadata.create_all(bind=engine)

app = FastAPI()

instrumentator = Instrumentator().instrument(app)
Instrumentator().instrument(app).expose(app)

@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    response = Response("Internal server error", status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response

@app.get("/ping", status_code=200)
async def ping():
    return {"ping": "ok"}


app.include_router(users.router)


# @app.post("/users/{user_id}/todos/", response_model=schemas.Todo)
# def create_todo_for_user(
#     user_id: int, todo: schemas.TodoCreate, db: Session = Depends(get_db)
# ):
#     return crud.create_user_todo(db=db, todo=todo, user_id=user_id)


# @app.get("/users/{user_id}/todos/", response_model=list[schemas.Todo])
# def get_todos_for_user(user_id: int, skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
#     return crud.get_todos_by_user(db, user_id, skip, limit)


# @app.get("/todos/", response_model=list[schemas.Todo])
# def read_todos(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
#     todos = crud.get_todos(db, skip=skip, limit=limit)
#     return todos

# @app.get("/todo/{todo_id}", response_model=schemas.Todo)
# def get_todo(todo_id: int, user_id: int, db: Session = Depends(get_db)):
#     todo = crud.get_user_todo(db, user_id, todo_id)
#     if todo is None:
#         raise HTTPException(404, "Todo not found")
#     return todo

# @app.delete("/todo/{todo_id}", response_model=schemas.Todo)
# def delete_todo(todo_id: int, db: Session = Depends(get_db)):
#     todo = crud.delete_todo(db, todo_id)
#     if todo is None:
#         raise HTTPException(404, "Todo not found")
#     return todo
