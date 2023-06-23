sudo apt update
sudo apt upgrade -y
sudo apt install nginx -y
sudo echo "server {
    listen 8080;
    location / {
        proxy_pass http://chat.openai.com;  
    }
}
" > /etc/nginx/sites-available/reverse_proxy.conf

sudo ln -s /etc/nginx/sites-available/reverse_proxy.conf /etc/nginx/sites-enabled/

sudo systemctl restart nginx

