from flask import Flask, render_template, request, redirect, url_for
import numpy as np

app = Flask(__name__)

def picked_up():
    messages = [
        "こんにちは",
        "こんばんは",
        "おはよう"
    ]
    return np.random.choice(messages)

@app.route('/')
def index():
    title = "ようこそ"
    message = picked_up()
    return render_template('index.html',
                           message=message, title=title)

@app.route('/post', methods=['GET', 'POST'])
def post():
    title = "こんにちは"
    if request.method == 'POST':
        name = request.form['name']
        return render_template('index.html',
                               name=name, title=title)
    else:
        return redirect(url_for('index'))

if __name__ == '__main__':
    app.debug = True # debug mode
    app.run(host='0.0.0.0') # enable to access from anywhere
