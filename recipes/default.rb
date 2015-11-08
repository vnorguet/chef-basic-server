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
user 'omicron' do
  home "/home/omicron"
  manage_home true
  shell "/bin/zsh"
end

ssh_authorize_key 'omicron' do
  key 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCw3oiCrYu0jx47w1OSh2q06H77eB/VYBW/l0ASE68rJyF17y/mbcVyp+xCKOlIJSWkmJJAMnjlSFjwVZ0ZcdNWsaJZrCXDYzL5CnNf4w2wpM/6h6BoemK3zOCBNm5C6b81KeedGT/szpbhgSnwpq8pFo0q4ihiufJBXp9Lo6mKX9b5HsLEPpjbkuluXAi1u2Mg4wNPM9wTfhrR1jhHEX7nCvGebO2CJoeDLR4VErYLTXgUSyWAbkkkPl9tIH3NVPJtywkaOcSoqiq/d9IcKY8jXG0wIAOfYdV2/DOls+wZBO3MClqOYOgcJ3sFJXwHLFpT97Q9XrDaY8XlSAjJAE0r'
  user 'omicron'
  options(
    'no-agent-forwarding' => false
  )

end

node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['users'] = ["omicron", "vagrant"]
include_recipe "sudo"
