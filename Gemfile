source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby '2.5.0'

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

### view
gem 'bootstrap', '~> 4.0'
gem 'tether-rails', '~> 1.4'
gem 'font-awesome-sass', '~> 5.0', '>= 5.0.6.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'social-share-button'
gem 'rinku'

### flag
gem 'flag-icons-rails'

### debug
gem 'pry-byebug'

### seo
gem 'meta-tags'
gem 'sitemap_generator'
gem 'aws-sdk'

### devise
gem 'devise'
gem 'omniauth-twitter'

### admin
gem 'activeadmin'

### gmap
gem 'gmaps4rails'
gem 'geocoder'

### Date Time Picker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'

### breadcrumbs
gem "gretel"

### google analytics
gem 'google-analytics-rails', '1.1.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  ### model
  gem 'annotate', '~> 2.7', '>= 2.7.2'
  ### debug
  gem "better_errors"
  gem "binding_of_caller"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
