default_run_options[:pty] = true

set :application, "wedidit"
set :user, "cscotta"
set :repository,  "git@github.com:cscotta/wedidit.git"
set :port, 2122

set :runner, "cscotta"

set :deploy_to, "/home/cscotta/public_html/#{application}"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :scm, "git"
set :scm_passphrase, "lum1n0usn0mad" #This is your custom users password

set :branch, "master"


set :location, "app.sunagocommunity.org"

role :app, location
role :web, location
role :db,  location, :primary => true

# task :after_update_code, :roles => :app do
#  %w{profiles}.each do |share|
#    run "rm -rf #{release_path}/public/assets/accounts"
#    run "mkdir -p #{shared_path}/system/accounts"
#    run "ln -nfs #{shared_path}/system/assets/accounts #{release_path}/public/assets/accounts"
#  end
  
# end