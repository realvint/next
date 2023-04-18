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

gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'stimulus-rails'
# gem "sassc-rails"

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'faker'
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
end
