### Generate private key using openssl. You will be prompted for passphrase.
```shell
openssl req -newkey rsa:2048 -nodes -keyout certs/key.pem -x509 -days 365 -out certs/cert.pem
```
# Initialize terraform.
- this command will take a while for it will try to startup the postgresql container first.
## 
```shell
docker-compose build
docker-compose run --rm iac init
```
# Vew & Apply terraform infrastructure.
```shell
docker-compose run --rm iac plan
docker-compose run --rm iac apply --auto-approve
```
## To rebuild and only start the postgresql container.
```shell
docker-compose up --build -d terraform_backend
```
## View riunning contaienrs.
```
docker ps --format "table {{.Names}}\t{{.Mounts}}\t{{.Ports}}\t{{.Image}}"
```

## Destroy terraform infrastructure.
```
docker-compose run --rm iac destroy --auto-approve
```

# References:
- https://www.postgresql.org/docs/9.5/ssl-tcp.html
- https://ubiq.co/database-blog/how-to-enable-ssl-in-postgresql/
- https://superuser.com/questions/556493/permissions-for-ssl-key
- https://www.terraform.io/language/settings/backends/pg
- https://learn.hashicorp.com/tutorials/terraform/docker-build?in=terraform/docker-get-started