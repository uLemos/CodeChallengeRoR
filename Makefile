# Variáveis
DOCKER_COMPOSE = docker-compose
RAILS_ENV = development
SERVICE = web

# Tarefas
.PHONY: help up down build logs test migrate db-create db-migrate

help:  ## Mostra todos os comandos disponíveis no Makefile
	@echo "Makefile Commands:"
	@echo "  make up          - Start Docker containers"
	@echo "  make down        - Stop Docker containers"
	@echo "  make build       - Build Docker images"
	@echo "  make logs        - View Docker logs"
	@echo "  make test        - Run RSpec tests"
	@echo "  make migrate     - Run database migrations"
	@echo "  make db-create   - Create database"

up: ## Start Docker containers
	$(DOCKER_COMPOSE) up -d

down: ## Stop Docker containers
	$(DOCKER_COMPOSE) down

build: ## Build Docker images
	$(DOCKER_COMPOSE) build

logs: ## View Docker logs
	$(DOCKER_COMPOSE) logs -f $(SERVICE)

test: ## Run RSpec tests
	$(DOCKER_COMPOSE) run --rm $(SERVICE) bundle exec rspec

migrate: ## Run database migrations
	$(DOCKER_COMPOSE) run --rm $(SERVICE) bundle exec rails db:migrate RAILS_ENV=$(RAILS_ENV)

db-create: ## Create the database
	$(DOCKER_COMPOSE) run --rm $(SERVICE) bundle exec rails db:create RAILS_ENV=$(RAILS_ENV)

