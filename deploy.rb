require "mt-capistrano"

set :site,         "25657"
set :application,  "wedidit"
set :webpath,      "www.wedidit.us"
set :domain,       "wedidit.us"
set :user,         "serveradmin@phoreo.com"
set :password,     "lum1n0usn0mad"

# repository on (gs)
set :repository, "svn+ssh://#{user}@#{domain}/home/#{site}/data/repo/app1/trunk"

set :repository,  "git@github.com:cscotta/wedidit.git"

# repository elsewhere
#set :repository, "svn+ssh://user@other.com/usr/local/svn/repo/app1/trunk"
#set :repository, "https://other.com/usr/local/svn/repo/app1/trunk"
#set :scm_password, "xxxxxxxx"

# which environment to work in
set :rails_env,    "production"

# necessary for functioning on the (gs)
default_run_options[:pty] = true

# these shouldn't be changed
role :web, "#{domain}"
role :app, "#{domain}"
role :db,  "#{domain}", :primary => true
set :deploy_to,    "/home/#{site}/containers/rails/#{application}"

# uncomment if desired
#after "deploy:update_code".to_sym do
#  put File.read("deploy/database.yml.mt"), "#{release_path}/config/database.yml", :mode => 0444
#end

# update .htaccess rules after new version is deployed
after "deploy:symlink".to_sym, "mt:generate_htaccess".to_sym
