install: 
	#install command
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format: 
	#format
	black *.py lib/*.py
lint: 
	#pylint
	pylint --disable=R,C *.py lib/*.py
test: #test
deploy: #deploy
all: install lint test deploy