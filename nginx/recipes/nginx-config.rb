apt_package "nginx" do
 action :install
end

execute "mkdir ssl" do
 command "mkdir /etc/nginx/ssl"
end

execute "create cert" do
 command "openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US'"
end

template "/etc/nginx/nginx.conf" do
 source "nginxconf.erb"
 action :create
end

service "nginx" do
 action :start
end
