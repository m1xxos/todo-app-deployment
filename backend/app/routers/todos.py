from fastapi import APIRouter, Depends, HTTPException
from .. import crud, schemas, dependencies
from sqlalchemy.orm import Session

router = APIRouter(prefix="/todo", 
                   dependencies=[Depends(dependencies.get_db)])


@router.post("/", response_model=schemas.Todo)
def create_todo_for_user(
    user_id: int, todo: schemas.TodoCreate, db: Session = Depends(dependencies.get_db)
):
    return crud.create_user_todo(db=db, todo=todo, user_id=user_id)


@router.get("/{todo_id}", response_model=schemas.Todo)
def get_todo(todo_id: int, user_id: int, db: Session = Depends(dependencies.get_db)):
    todo = crud.get_user_todo(db, user_id, todo_id)
    if todo is None:
        raise HTTPException(404, "Todo not found")
    return todo


@router.delete("/{todo_id}", response_model=schemas.Todo)
def delete_todo(todo_id: int, db: Session = Depends(dependencies.get_db)):
    todo = crud.delete_todo(db, todo_id)
    if todo is None:
        raise HTTPException(404, "Todo not found")
    return todo


@router.get("/users/{user_id}/todos/", response_model=list[schemas.Todo])
def get_todos_for_user(user_id: int, skip: int = 0, limit: int = 100, db: Session = Depends(dependencies.get_db)):
    return crud.get_todos_by_user(db, user_id, skip, limit)


@router.get("/all", response_model=list[schemas.Todo])
def read_todos(skip: int = 0, limit: int = 100, db: Session = Depends(dependencies.get_db)):
    todos = crud.get_todos(db, skip=skip, limit=limit)
    return todos
