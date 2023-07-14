 server {
    listen 80;
    listen [::]:80;
    server_name  86.244.189.89;

    root /var/www/example.com;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
