# Wine HRS

The Wine Hotel/Restaurant/Café Recommender System is a Django2/Python3 web application with accompanying Android and iOS hybrid apps.

# Deployment

If your server is running Debian/Ubuntu:

```bash
sudo apt install python3-pip python3-dev libpq-dev postgresql postgresql-contrib nginx
```

If your server is running CentOS/RedHat/Fedora:

```bash
sudo yum install python3-pip python3-devel postgresql-libs postgresql postgresql-contrib nginx
```

or

```bash
sudo dnf install python3-pip python3-devel postgresql-libs postgresql postgresql-contrib nginx
```

## Clone the repo

```bash
cd $HOME
git clone https://github.com/StanGenchev/Horeca-RS.git
```

## Create the PostgreSQL Database and User

```bash
sudo -u postgres psql
CREATE DATABASE hrs;
CREATE USER hrsuser WITH PASSWORD 'password';
ALTER ROLE hrsuser SET client_encoding TO 'utf8';
ALTER ROLE hrsuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE hrsuser SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE hrs TO hrsuser;
\q
```

## Create a Python Virtual Environment

```bash
sudo -H pip3 install virtualenv
mkdir ~/horeca
cd ~/horeca
virtualenv horeca
source horeca/bin/activate
pip install django gunicorn psycopg2-binary
cp -r $HOME/Horeca-RS/* $HOME/horeca
```

## Change domain/IP and postgres settings

Open settings.py:

```bash
nano $HOME/horeca/hrs/settings.py
```

Go to line 28 and change the allowed hosts:

```bash
ALLOWED_HOSTS = ['localhost', '192.168.1.2', '.some.domain.com']
```

Then go to line 77 and change the user and password:

```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'hrs',
        'USER': 'hrsuser',
        'PASSWORD': 'your-db-user-password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

You can also disable the debugging mode, if you do not need it, by editing line 26 to:

```bash
DEBUG = False
```

## Migrate the initial database schema to PostgreSQL

If you are not in the horeca python virtualenv, you can enter it by typing:

```bash
workon horeca
```

Then enter the following commands:

```bash
$HOME/horeca/manage.py makemigrations
$HOME/horeca/manage.py migrate
$HOME/horeca/manage.py createsuperuser
$HOME/horeca/manage.py collectstatic
```

## Testing Gunicorn's Ability to Serve the Project

Create an exception for port 8000 (or the port which you prefer) by typing:

```bash
sudo ufw allow 8000
```

Test gunicorn:

```bash
cd $HOME/horeca
gunicorn --bind 0.0.0.0:8000 horeca.wsgi
```

Go to http://your-domain.com:8000 and test the site.

## Create a Gunicorn systemd Service File

```bash
sudo nano /etc/systemd/system/gunicorn.service
```

Paste the following lines inside (replace 'your-system-username' with your user):

```bash
[Unit]
Description=gunicorn daemon
After=network.target

[Service]
User=your-system-username
Group=www-data
WorkingDirectory=/home/your-system-username/horeca
ExecStart=/home/your-system-username/horeca/bin/gunicorn --access-logfile - --workers 3 --bind unix:/home/your-system-username/horeca/hrs.sock hrs.wsgi:application

[Install]
WantedBy=multi-user.target
```

## Start and enable Gunicorn systemd service

```bash
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
```

If you make changes to the /etc/systemd/system/gunicorn.service file, reload the daemon to reread the service definition and restart the Gunicorn process by typing:

```bash
sudo systemctl daemon-reload
sudo systemctl restart gunicorn
```

If there are any errors you can check the log by executing:

```bash
sudo journalctl -u gunicorn
```

## Configure Nginx to Proxy Pass to Gunicorn

Create a new server block for Nginx:

```bash
sudo nano /etc/nginx/sites-available/horeca
```

Type the following lines:

```bash
server {
    listen 8000;
    server_name hrs.quanterall.com;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/your-system-username/horeca;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/home/your-system-username/horeca/hrs.sock;
    }
}

```

Enable the file by linking it to the sites-enabled directory:

```bash
sudo ln -s /etc/nginx/sites-available/horeca /etc/nginx/sites-enabled
```

Test your Nginx configuration for syntax errors by typing:

```bash
sudo nginx -t
```

If no errors are reported, restart Nginx by typing:

```bash
sudo systemctl restart nginx
```

If you encounter errors, you can check the log file:

```bash
sudo tail -F /var/log/nginx/error.log
```
