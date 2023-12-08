install: 
	#install command
	pip install --upgrade pip &&\
		pip install -r requirements.txt
post-install:
	python -m textblob.download_corpora
format: 
	#format
	black *.py mylib/*.py
lint: 
	#pylint
	pylint --disable=R,C *.py mylib/*.py
test: #test 
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build: 
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	#docker run -p 127.0.0.1:8080:8080 <image_id>
deploy: 
	#deploy
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 748909003339.dkr.ecr.us-east-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 748909003339.dkr.ecr.us-east-1.amazonaws.com/wiki:latest
	docker push 748909003339.dkr.ecr.us-east-1.amazonaws.com/wiki:latest
all: install lint test deploy