source 'https://rubygems.org'

gem 'rails',        '5.2.3'
gem 'bootsnap'
gem 'mini_magick'
gem 'puma',         '3.9.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem "omniauth-google-oauth2", "~> 0.2.1"

gem 'byebug',  '9.0.6', platform: :mri
group :development, :test do
  gem 'sqlite3', '1.3.13'
end

gem 'web-console',           '3.5.1'
gem 'listen',                '3.1.5'
gem 'spring',                '2.0.2'
gem 'spring-watcher-listen', '2.0.1'
group :development do
end

group :production do
  gem 'pg'
  gem 'rails_12factor' 
end

gem "active_model_serializers"
gem 'rack-cors', :require => 'rack/cors'

# Windows does not include zoneinfo files, so bundlerails g serializer message the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]