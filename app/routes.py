from app.main import app

@app.route('/')
@app.route('/index')
def index():
    return "hello world"
