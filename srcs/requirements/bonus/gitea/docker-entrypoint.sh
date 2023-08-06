#! /bin/bash
set -e

validate_envs() {
	if [ -z "$MYSQL_GITEA_USER" -o -z "$MYSQL_GITEA_PASSWD" -o -z "$MYSQL_GITEA_DATABASE" -o -z "$MYSQL_HOST" -o -z "$NGINX_DOMAIN" ]; then
		cat <<- 'EOF'
		  Can't start the mysql server without all the env variables:
		    - MYSQL_ROOT_PASSWD
		    - MYSQL_USER
		    - MYSQL_USER_PASSWD
		    - MYSQL_DATABASE
		    - MYSQL_GITEA_USER
		    - MYSQL_GITEA_PASSWD
		    - MYSQL_GITEA_DATABASE
		EOF
		exit 1
	fi
}

setup_gitea() {
	sed -i "s/\$MYSQL_GITEA_USER/$MYSQL_GITEA_USER/g" /home/git/app.ini
	sed -i "s/\$MYSQL_GITEA_PASSWD/$MYSQL_GITEA_PASSWD/g" /home/git/app.ini
	sed -i "s/\$MYSQL_GITEA_DATABASE/$MYSQL_GITEA_DATABASE/g" /home/git/app.ini
	sed -i "s/\$MYSQL_HOST/$MYSQL_HOST/g" /home/git/app.ini
	sed -i "s/\$NGINX_DOMAIN/$NGINX_DOMAIN/g" /home/git/app.ini
}

main() {
	validate_envs
	setup_gitea
	echo "Gitea running on port :3000"
	exec "$@"
}

main "$@"
