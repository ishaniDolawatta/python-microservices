install: 
	#install command
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format: 
	#format
	black *.py mylib/*.py
lint: 
	#pylint
	pylint --disable=R,C *.py mylib/*.py
test: #test
deploy: #deploy
all: install lint test deploy