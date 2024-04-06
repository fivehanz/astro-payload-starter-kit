MAKEFLAGS=+j3

init: 
	# make create-cms
	make -j2 deps
	make -j2 dev

mise:
	mise install

create-cms:
	bun --silent create payload-app@latest -- -n cms -t blank --no-deps

#### DEPENDECIES ####

deps: deps-frontend deps-cms

deps-frontend:
	cd frontend && bun --bun install

deps-cms: 
	cd cms && bun install

#### DEVELOP ####

dev: dev-frontend dev-docker-compose-posgres-db dev-cms

dev-frontend: 
	cd frontend && bun --bun run dev

dev-cms:  ## uses node
	cd cms && bun run dev

dev-docker-compose-posgres-db:
	docker compose -f ./cms/docker-compose.yml up 
