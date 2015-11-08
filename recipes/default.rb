#
# Cookbook Name:: basic-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Standard tools available on all servers

execute "Update apt" do
  command "apt-get update"
end

include_recipe "git"
include_recipe "zsh"

package 'vim'
package "curl"
package "htop"

node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['users'] = ["vagrant"]
include_recipe "sudo"
