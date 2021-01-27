.DEFAULT_GOAL := initProject
CWD := $(shell pwd)
NETWORK := $(shell basename `pwd`)_default

initProject: db back dashboard front docker

db:
	@gsudo chmod +x ./initdb.sh && ./initdb.sh

back:
	@git clone git@github.com:SlavaOdinokov/back.git
dashboard:
	@git clone git@github.com:SlavaOdinokov/dashboard.git
front:
	@git clone git@github.com:SlavaOdinokov/front.git

docker:
	@docker-compose up -d
docker-reset:
	@docker-compose down
	@docker volume prune -f
	@docker-compose build
	@acho 'Project has been reset'
docker-stop:
	@docker-compose down
