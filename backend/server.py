import os, logging
from flask import Flask, send_from_directory, request

app = Flask(__name__)
app.logger.setLevel(logging.ERROR)

@app.route('/yalp/pkg/<path:path>')
def send_package(path):
    return send_from_directory('packages', path)

@app.route('/yalp/search')
def search_packages():
    q = request.args.get('q')
    files = os.listdir('packages')
    matching = [f.split('.config')[0] for f in files if f.endswith('.config') and q in f]
    resp = f'Found {len(matching)} packages for query "{q}":\n'
    resp += '\n'.join(f' {f}' for f in matching)
    return resp+'\n'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)