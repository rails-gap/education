# config valid only for current version of Capistrano
lock "3.7.1"

set :application, 'edupor'
set :repo_url, 'git@github.com:rails-gap/edupor.git'
set :deploy_to, '/var/www/edupor'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/omniauth.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')
set :branch, 'master'
set :deploy_via, :copy
set :user, 'gapuser'
set :ssh_options, { forward_agent: true, port: 5422 }
set :passenger_restart_with_touch, true
