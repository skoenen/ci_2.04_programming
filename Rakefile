require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem "rake"

  gem "sinatra"
  gem "haml"
  gem "kramdown"

  gem 'sprockets', :git => "https://github.com/rails/sprockets.git", tag: "v4.0.0.beta8"
  #gem 'sprockets-helpers'
  gem 'sass'
  gem 'sassc'
end

require 'sinatra/base'

class SlideServer < Sinatra::Application
  @content = "content"
  @template = "template"
  @assets = File.join(@template, "assets")

  set :root, @content
  set :views, @content

  set :sprockets, Sprockets::Environment.new
  settings.sprockets.append_path(@assets)
  settings.sprockets.css_compressor = :scss
  set :bind, '::1'

  get "/assets/*" do
    env['PATH_INFO'].sub!('/assets', '')
    settings.sprockets.call(env)
  end

  get "/" do
    haml :index,
      :layout => :layout,
      :layout_options => { views:  "template" }
  end

  get "/:filename.html" do |filename|
    puts "Handle request for '#{filename}.html.haml'"

    haml filename.to_sym,
      :layout => :layout,
      :layout_options => { views: "template" }
  end

  run!
end

task default: %w( serve )

task :serve do
  server = SlideServer.new
  server.run
end

