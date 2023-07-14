 server {
    listen 80;
    listen [::]:80;
    server_name  86.244.189.89;

    location /exp1 {
        proxy_pass  http://192.168.1.43:6000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
    location / {
        try_files $uri $uri/ =404;
    }
}
