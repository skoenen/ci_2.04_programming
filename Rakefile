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

  gem 'ruby-graphviz'
end

require 'sinatra/base'


task default: %w( lecture )

task :lecture do
  puts "Starting Lecture Server"

  class SlideServer < Sinatra::Application
    @content = "lecture"
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

    get "/graph/*.*" do |filename, ext|
      fullpath = File.join(settings.root, "graphs", "#{filename}.dot")

      puts fullpath
      graph = GraphViz.parse( fullpath ) {|g| }

      case ext
      when "jpg"
        content_type "image/jpeg"
        output = graph.output :jpeg => String

      when "png"
        content_type "image/png"
        output = graph.output :png => String

      else
        content_type "image/svg+xml"
        output = graph.output :svg => String
      end

      #puts output

      body output
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
end

task :excercise do
  puts "Starting Excercise Server"

  class SlideServer < Sinatra::Application
    @content = "excercise"
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

    get "/graph/*.*" do |filename, ext|
      fullpath = File.join(settings.root, "graphs", "#{filename}.dot")

      puts fullpath
      graph = GraphViz.parse( fullpath ) {|g| }

      case ext
      when "jpg"
        content_type "image/jpeg"
        output = graph.output :jpeg => String

      when "png"
        content_type "image/png"
        output = graph.output :png => String

      else
        content_type "image/svg+xml"
        output = graph.output :svg => String
      end

      #puts output

      body output
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
end

task :practica do
  puts "Starting Practica Server"

  class SlideServer < Sinatra::Application
    @content = "practica"
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

    get "/graph/*.*" do |filename, ext|
      fullpath = File.join(settings.root, "graphs", "#{filename}.dot")

      puts fullpath
      graph = GraphViz.parse( fullpath ) {|g| }

      case ext
      when "jpg"
        content_type "image/jpeg"
        output = graph.output :jpeg => String

      when "png"
        content_type "image/png"
        output = graph.output :png => String

      else
        content_type "image/svg+xml"
        output = graph.output :svg => String
      end

      #puts output

      body output
    end

    get "/" do
      haml :index,
        :layout => :layout,
        :layout_options => { views:  "template" }
    end

    get "/:filename.html" do |filename|
      haml filename.to_sym,
        :layout => :layout,
        :layout_options => { views: "template" }
    end

    run!
  end
end

