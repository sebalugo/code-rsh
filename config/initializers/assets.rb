# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( TimeCircles.js )
Rails.application.config.assets.precompile += %w( javascript.js )
Rails.application.config.assets.precompile += %w( TimeCircles.css )
Rails.application.config.assets.precompile += %w( leaderboard.js )
Rails.application.config.assets.precompile += %w( ruby_lobby.js )
Rails.application.config.assets.precompile += %w( java_lobby.js )
Rails.application.config.assets.precompile += %w( js_lobby.js )
Rails.application.config.assets.precompile += %w( python_lobby.js )
Rails.application.config.assets.precompile += %w( match.css )
Rails.application.config.assets.precompile += %w( user_profile.css )
Rails.application.config.assets.precompile += %w( match.js )
Rails.application.config.assets.precompile += %w( profile_chart.js )


Rails.application.config.assets.precompile += %w( ruby.js )
Rails.application.config.assets.precompile += %w( java.js )
Rails.application.config.assets.precompile += %w( javascript.js )
Rails.application.config.assets.precompile += %w( python.js )

Rails.application.config.assets.precompile += %w( multiplayer_match.js )

%w(users home sessions categories courses).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end

