.PHONY: build  deploy upload debug invoke run

run:
	streamlit run main.py

build: 
	docker build -t kimacloud .

debug: build
	docker run -it --rm -p 8001:8001 kimacloud

upload:
	docker tag kimacloud:latest 378162708610.dkr.ecr.cn-northwest-1.amazonaws.com.cn/kimacloud:latest
	docker push 378162708610.dkr.ecr.cn-northwest-1.amazonaws.com.cn/kimacloud:latest

deploy: upload
	# aws ecs update-service --cluster kimacloud --service kimacloud --task-definition kimacloud:latest
	curl --location 'http://app.kimacloud.com:8000/api/v1/deploy?uuid=aw8w8owkgk0cckkgckw4gsg4&force=false' --header 'Content-Type: application/json' --header 'Authorization: Bearer 2|J8WgS5ygtqC3uu66Al7x2uBgK22RLBP3tkqRK6z5d47c2745' --data '{"content": "Posted Via Command line"}'

invoke:
	curl --location 'http://app.kimacloud.com:8000/api/v1/deploy?uuid=aw8w8owkgk0cckkgckw4gsg4&force=false' --header 'Content-Type: application/json' --header 'Authorization: Bearer 2|J8WgS5ygtqC3uu66Al7x2uBgK22RLBP3tkqRK6z5d47c2745' --data '{"content": "Posted Via Command line"}'

login:
	aws ecr get-login-password --region cn-northwest-1 | docker login --username AWS --password-stdin 378162708610.dkr.ecr.cn-northwest-1.amazonaws.com.cn

compose:
	curl --location 'https://app.kimacloud.com/api/v1/deploy?uuid=sg8ksg8c0wo00o80wg4o4s04&force=false' --header 'Content-Type: application/json' --header 'Authorization: Bearer 2|J8WgS5ygtqC3uu66Al7x2uBgK22RLBP3tkqRK6z5d47c2745' --data '{"content": "Posted Via Command line"}'

	