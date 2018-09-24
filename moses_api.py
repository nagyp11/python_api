import subprocess
from flask import request
from flask_api import FlaskAPI
import json
import os

app = FlaskAPI(__name__)

cwd = os.getcwd()
processDir = cwd+'/process'

@app.route('/translate', methods=['GET', 'POST'])
def translate():
	if not os.path.isdir(processDir):
		os.mkdir(processDir)
	text = request.data.get('text', '')
	if text == '':
		return {'status': '400', 'info': 'No text added' }
	print(text)
	f = open(processDir+'/input.noacc', "w")
	f.write(text)
	f.close()
	subprocess.call(cwd+'/preprocess.sh')
	f = open(processDir+'/input.noacc.tokenized.lc.noxml', 'r')
	preprocessed = f.read()
	f.close()
	return {'status': '200', 'info': 'success', 'text': preprocessed }

@app.route('/', methods=['GET'])
def info():
	return {'info': 'API Available'}

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=9001)
