docker-compose down -v
sleep 5
echo y | docker volume prune
docker-compose build
docker-compose run --rm iac init