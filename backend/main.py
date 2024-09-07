from fasthtml.common import *

app,rt = fast_app()

@rt('/')
def get():
    frm = Form(Group(Input(name="title", placeholder="Title"),
                     Button('add')),
                     hx_post='/', target_id='todo-list', hx_swap='beforeend')
    tdlist = Ul(Li('#1'), Li('#2'), id='todo-list')
    return Titled("Todo list", frm, tdlist)

@rt('/')
def post(title:str): return title

serve()
