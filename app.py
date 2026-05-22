from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "<h1> Just making changes to see if the app is working as expected.

KRS First Ever DevOps Pipeline: Operational</h1><p>Triggered via GitHub Actions & Ansible.</p>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
