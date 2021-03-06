U := deploy

production-setup:
	ansible-playbook ansible/site.yml -i ansible/production -u $U --ask-sudo-pass

production-env-update:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U --tag env

production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U --ask-become-pass

production-build-and-push:
	docker build -t codebattle/app --file services/app/Dockerfile.prod services/app/
	docker push codebattle/app

production-upload-langs:
	ansible-playbook ansible/langs.yml -i ansible/production -u $U -vv
