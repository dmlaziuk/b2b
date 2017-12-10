# config valid for current version and patch releases of Capistrano
lock '~> 3.10.0'

set :application, 'b2b'
set :repo_url, 'git@github.com:dmlaziuk/b2b.git'
set :branch, 'master'
set :deploy_to, '/var/www/b2b'

set :ssh_options, forward_agent: true
set :pty, false

set :linked_files, %w[config/database.yml config/redis.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets public/system public/assets]

set :rvm_ruby_version, '2.4.1@b2b'

set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
set :sidekiq_processes, 2
set :sidekiq_log, "#{current_path}/log/sidekiq.log"
set :sidekiq_role, :sidekiq

set :puma_preload_app, true
set :puma_init_active_record, true
#set :port, '3000'

# production.rb file
set :rails_env, 'production'
set :puma_threads, [4, 12]
set :puma_workers, 2

server '18.217.123.149', user: 'deployer', roles: %w[app web db sidekiq]
