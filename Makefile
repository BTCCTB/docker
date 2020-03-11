user := $(shell id -u)
group := $(shell id -g)
doc := USER_ID=$(user) GROUP_ID=$(group) docker

.DEFAULT_GOAL := help
.PHONY: help
help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: symfony-dev nodejs ## Build & publish all Enabel docker images

.PHONY: symfony
symfony: publish-symfony ## Build & publish symfony docker images

.PHONY: build-symfony
build-symfony: ## Build symfony docker images
	$(doc) build ./php-symfony -t enabel/php-symfony 
	$(doc) build ./httpd-symfony -t enabel/httpd-symfony 

.PHONY: publish-symfony
publish-symfony: build-symfony ## Publish symfony docker images
	$(doc) push enabel/php-symfony 
	$(doc) push enabel/httpd-symfony 

.PHONY: symfony-dev
symfony-dev: symfony publish-symfony-dev ## Build & publish symfony/symfony-dev docker images

.PHONY: build-symfony-dev
build-symfony-dev: build-symfony ## Build symfony docker images
	$(doc) build ./php-symfony-dev -t enabel/php-symfony-dev
	$(doc) build ./httpd-symfony-dev -t enabel/httpd-symfony-dev

.PHONY: publish-symfony-dev
publish-symfony-dev: build-symfony-dev ## Publish symfony docker images
	$(doc) push enabel/php-symfony-dev
	$(doc) push enabel/httpd-symfony-dev 


.PHONY: nodejs
nodejs: publish-nodejs ## Build & publish nodejs docker images

.PHONY: build-nodejs
build-nodejs: ## Build nodejs docker images
	$(doc) build ./nodejs -t enabel/nodejs

.PHONY: publish-nodejs
publish-nodejs: build-nodejs ## Publish nodejs docker images
	$(doc) push enabel/nodejs
