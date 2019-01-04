lock "~> 3.11.0"
set :application, "blog"
set :repo_url, "git@github.com:soreddysirish/blogDeloyment.git"
set :branch, 'master'
set :keep_releases, 5
set :format, :pretty
set :log_level, :debug
set :pty, true
set :stages, %w(production development)
set :default_stage, "development"
set :ssh_options, {:forward_agent => true}
set :user , "ubuntu"
set :deploy_to, "/var/www/blog"

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system}
set :migration_role, 'app' # Defaults to 'db'
set :assets_roles, [:app] # Defaults to [:web]
set :linked_files, %w(config/database.yml)
SSHKit.config.command_map[:rake] = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"


namespace :deploy do
 desc 'Restart application'
  task :restart do
   on roles(:app), in: :sequence, wait: 5 do
   execute "sudo service apache2 restart"
  end
 end
 
 after :finishing, 'deploy:restart'
 after :finishing, 'deploy:cleanup'
end
