# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
require 'capistrano/nginx'
require 'capistrano/puma'
install_plugin Capistrano::Puma::Nginx
require 'capistrano/rvm'
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/upload-config'
require 'sshkit/sudo'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }