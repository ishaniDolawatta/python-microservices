install: 
	#install command
	pip install --upgrade pip &&\
		pip install -r requirements.txt

post-install:
	python3 -m textblob.download_corpora

format: 
	#format
	black *.py mylib/*.py
lint: 
	#pylint
	pylint --disable=R,C *.py mylib/*.py
test: #test 
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build: #build container
deploy: #deploy
all: install lint test deploy