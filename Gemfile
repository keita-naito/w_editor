source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "active_model_serializers", "~> 0.10.0"
gem "bootsnap", ">= 1.1.0", require: false
gem "config"
gem "devise_token_auth"
gem "pg"
gem "puma", "~> 3.11"
gem "rack-cors"
gem "rails", "~> 6.0.3"
gem "turbolinks", "~> 5"
gem "webpacker"

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "foreman" # Procfile を読み込み、複数のプロセスを管理できるツール
  gem "listen", "~> 3.2.1"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "annotate"
  gem "rails-erd"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
