if node["already_completed"]
 apt_package "ssh" do
  action :install
 end

 template "/etc/ssh/sshd_config" do
  source "sshconfig.erb"
  action :create
 end

 execute "groupadd sshusers" do
  command "groupadd sshusers"
 end
end

ruby_block "already_completed" do
 block do
  node.normal["already_completed"] = true
 end
end 
