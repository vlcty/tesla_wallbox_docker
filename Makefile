up:
	docker-compose up -d

down:
	docker-compose down

reset: down
	docker volume rm tesla_wallbox_docker_influx-config
	docker volume rm tesla_wallbox_docker_influx-data
