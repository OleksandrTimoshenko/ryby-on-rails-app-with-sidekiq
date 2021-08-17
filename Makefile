include .env

registry-login:
	echo "${GITHUB_TOKEN}" | docker login ghcr.io -u ${GITHUB_USER} --password-stdin

generate-token:
	docker-compose run backend rake secret

run-tests:
	docker-compose run backend rake test