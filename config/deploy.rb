# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'studying-capistrano'
set :repo_url, 'git@github.com:syumai/studying-capistrano.git'
set :deploy_to, '/var/www/studying-capistrano'
set :format, :pretty
set :log_level, :debug
set :pty, true
set :keep_releases, 5

set :npm_roles, %i(app)

namespace :deploy do
  task :restart do
    on roles(:app) do
      invoke 'forever:restart'
    end
  end

  after :publishing, :restart
end
