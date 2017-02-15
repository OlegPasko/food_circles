# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.

Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join("app", "assets")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets")
Rails.application.config.assets.paths << Rails.root.join("public", "assets")

Rails.application.config.assets.precompile += %w( jquerysmartbanner.css )
Rails.application.config.assets.precompile += %w( colorbox.css )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( colorbox.css )
Rails.application.config.assets.precompile += %w( fonts.css )
Rails.application.config.assets.precompile += %w( restaurants.css )
Rails.application.config.assets.precompile += %w( restaurants.js )
Rails.application.config.assets.precompile += %w( nonprofits.css )
Rails.application.config.assets.precompile += %w( nonprofits.js )
Rails.application.config.assets.precompile += %w( students.css )
Rails.application.config.assets.precompile += %w( students.js )
Rails.application.config.assets.precompile += %w( jquerysmartbanner.js )
Rails.application.config.assets.precompile += %w( home.js )
Rails.application.config.assets.precompile += %w( colorbox.js )
Rails.application.config.assets.precompile += %w( fonts.js )
Rails.application.config.assets.precompile += %w( faq.css )
Rails.application.config.assets.precompile += %w( faq.js )
Rails.application.config.assets.precompile += %w( timeline.js )
Rails.application.config.assets.precompile += %w( timeline.css )

# Dont work, but WHY?

# Rails.application.config.assets.precompile += %w( *.css *.js )
#  Rails.application.config.assets.precompile += ['*app/assets/stylesheets/*']
#   Rails.application.config.assets.precompile += ['*app/assets/javascript/*']
# Rails.application.config.assets.precompile += %w( achievements.css, android.css, app.css, application.css, butterflies.css, chat.css, colorbox.css, companies.css, editor.css,faq.css, fonts.css,h ome.css, inbox.css, iphone.css, jquerysmartbanner.css, mobile.css, new_app.css, nominate.css, nonprofits.css, scsomniauth_ask_for_email.css, omniauth_callbacks.css, organizers.css, race.css, restaurants.css, scaffolds.css, screen.css, signup.css, socialbutterflies.css, students.css, style.css, venues.css )


# Rails.application.config.assets.precompile << Proc.new { |path|
#   if path =~ /\.(css|js)\z/
#     full_path = Rails.application.assets.resolve(path).to_s
#     app_assets_path = Rails.root.join('app', 'assets').to_s
#     if full_path.starts_with? app_assets_path
#       puts "including asset: " + full_path
#       true
#     else
#       puts "excluding asset: " + full_path
#       false
#     end
#   else
#     false
#   end
# }
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
