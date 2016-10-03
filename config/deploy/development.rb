PRIVATE_KEYS_PATH = %w(~/src/vagrant/scotch-box/.vagrant/machines/default/virtualbox/private_key)

server 'localhost', user: 'vagrant', roles: %w{app}

set :ssh_options, {
  port: 2222,
  keys: PRIVATE_KEYS_PATH,
  forward_agent: true,
  auth_methods: %w(publickey)
}

