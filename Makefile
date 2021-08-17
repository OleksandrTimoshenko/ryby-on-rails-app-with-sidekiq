include .env

registry-login:
	echo "${GITHUB_TOKEN}" | docker login ghcr.io -u ${GITHUB_USER} --password-stdin

generate-token:
	docker-compose run backend rake secret

run-tests:
	docker-compose run backend rake test


vagrant-provision:
#	vagrant plugin install vagrant-env;
	ansible-galaxy install -r deploy/ansible-requirements.yaml;
	cd ./deploy; GITHUB_TOKEN=${GITHUB_TOKEN} \
	GITHUB_USER=${GITHUB_USER} \
	PLAYBOOK_NAME=playbook.yaml \
	vagrant up --provision;