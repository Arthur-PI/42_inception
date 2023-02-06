#! /bin/bash

sed -ie "s/\$MYSQL_GITEA_USER/$MYSQL_GITEA_USER/g" /home/git/app.ini
sed -ie "s/\$MYSQL_GITEA_PASSWD/$MYSQL_GITEA_PASSWD/g" /home/git/app.ini
sed -ie "s/\$MYSQL_GITEA_DATABASE/$MYSQL_GITEA_DATABASE/g" /home/git/app.ini
sed -ie "s/\$MYSQL_HOST/$MYSQL_HOST/g" /home/git/app.ini

echo "Gitea running on port :3000"

exec $@