## To generate an example config file (a "disabled" one with all default settings, commented out):
```ansible-config init --disabled > ansible.cfg```

### Setup passwordless ssh on remote servers.

### Create virtualenvs on remote servers.
```mkdir -p ~/.virtualenvs``` \
```cd ~/.virtualenvs``` \
```virtualenv dev-env``` \
```source dev-env/bin/activate``` \
```pip3 -V``` \
```pip3 list``` \
```pip3 install paramiko``` \
```pip3 list```
### Install requirements.txt on remote servers.
```pip3 install -r requirements.txt```
### Accessing ansible documentation.
- List all modules \
```ansible-doc -l ```
- Display documentation for the ping module \
```ansible-doc ping```
## Issues:
- https://cri.dev/posts/2020-07-06-How-to-solve-Docker-docker-credential-desktop-not-installed-or-not-available-in-PATH/
## References:
- https://docs.ansible.com/ansible/2.9/modules/docker_compose_module.html#docker-compose-module
- https://docs.ansible.com/ansible/latest/collections/community/general/keycloak_client_module.html