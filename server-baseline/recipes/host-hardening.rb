if node["already_completed"]
 execute "apt-get update && upgrade" do
  command "apt-get update && apt-get upgrade -y"
 end

 execute "ufw deny incoming" do
  command "ufw default deny incoming"
 end

 execute "ufw allow http" do
  command "ufw allow https"
 end

 execute "ufw allow ssh" do
  command "ufw allow ssh"
 end

 execute "ufw logging" do
  command "ufw logging on"
 end 

 execute "ufw enable" do
  command "ufw enable"
 end
end

ruby_block "already_completed" do
 block do
  node.normal["already_completed"] = true
 end
end
