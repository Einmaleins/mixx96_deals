# RVM bootstrap
require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, '1.9.2-p320'
set :rvm_type, :system

# main details
set :application, "MIXX96 Deals"
role :web, "deals.mixx96.com"
role :app, "deals.mixx96.com"
role :db,  "deals.mixx96.com", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/deals.mixx96.com"
set :deploy_via, :remote_cache
set :user, "admin"
set :use_sudo, false

# repo details
set :scm, :git
set :scm_username, "jpignite"
set :repository, "git@github.com:pignite/mixx96_deals.git"
set :branch, "master"
set :git_enable_submodules, 1
set :normalize_asset_timestamps, false

# runtime dependencies
depend :remote, :gem, "bundler", ">=1.0.0.rc.2"

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

before "deploy:assets:precompile", "deploy:symlink_shared"
#after 'deploy:update_code', 'deploy:symlink_shared'

# namespace :bundler do
#   desc "Symlink bundled gems on each release"
#   task :symlink_bundled_gems, :roles => :app do
#     run "mkdir -p #{shared_path}/bundled_gems"
#     run "ln -nfs #{shared_path}/bundled_gems #{release_path}/vendor/bundle"
#   end

#   desc "Install for production"
#   task :install, :roles => :app do
#     run "cd #{release_path} && bundle install --production"
#   end

# end

# after 'deploy:update_code', 'bundler:symlink_bundled_gems'
# after 'deploy:update_code', 'bundler:install'
