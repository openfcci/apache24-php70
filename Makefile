all: push

build: build-memcached
	docker build -t apache24-php70 .

build-memcached: 
	docker-compose up && docker-compose down

tag: build
	docker tag apache24-php70 fccorg/apache24-php70

push: tag
	docker push fccorg/apache24-php70
