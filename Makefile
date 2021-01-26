.DEFAULT_GOAL := initProject
CWD := $(shell pwd)
NETWORK := $(shell basename `pwd`)_default

initProject: db back dashboard front

db:
	@chmod +x ./init.sh && ./init.sh

back:
	@git clone git@github.com:SlavaOdinokov/mevn-back.git
dashboard:
	@git clone git@github.com:SlavaOdinokov/mevn-dashboard.git
front:
	@git clone git@github.com:SlavaOdinokov/mevn-front.git

docker:
	@docker-compose up -d
docker-reset:
	@docker-compose down
	@docker volume prune -f
	@docker-compose build
	@acho 'Project has been reset'
docker-stop:
	@docker-compose down
