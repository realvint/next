source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'rails-i18n', '~> 7.0.0'

gem 'pg', '~> 1.1'
gem 'puma', '~> 6.1.0'
gem 'sprockets-rails'
gem 'turbo-rails'

gem 'cssbundling-rails'
gem 'jsbundling-rails'

gem "cocoon"
gem 'image_processing', '~> 1.2'
gem 'jbuilder'
gem 'pagy', '~> 6.0'
gem 'phonelib'
gem 'ransack', '~> 4.0.0'
gem 'redis', '~> 4.0'
gem 'rubyXL'
gem 'sassc-rails'
gem 'sidekiq'
gem 'slim-rails', '~> 3.6.1'
gem 'stimulus-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 5.0'
end
