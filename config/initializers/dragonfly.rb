# frozen_string_literal: true
require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret 'f9cc32e635840e46e93d49ade7c455ed2f18b860c2b88a53459e6b22d4272976'

  url_format '/media/:job/:name'

  datastore :file,
            root_path: Rails.root.join('public/system/dragonfly', Rails.env),
            server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
