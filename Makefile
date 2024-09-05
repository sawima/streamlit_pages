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
