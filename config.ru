# config.ru (run with `rackup`)

require 'sinatra/base'
require 'sprockets'
require 'ruby-graphviz'

class SlideServer < Sinatra::Base
  set :root, "base"
  set :views, "base"

  set :sprockets, Sprockets::Environment.new
  settings.sprockets.css_compressor = :scss
  settings.sprockets.append_path('template/assets')

  set :bind, "::"

  helpers do
    def blockcite(text, caption, src)
      haml = <<-HAML
%blockquote(cite="#{src}")
  %p.text
    :escaped
      #{text}
  %p.caption
    %a{ href: "#{src}", target: "_blank"}
      #{caption}
      HAML

      Haml::Engine.new(haml).render
    end
  end

  get "/assets/*" do
    env['PATH_INFO'].sub!('/assets', '')
    settings.sprockets.call(env)
  end

  get "/graph/*.*" do |filename, ext|
    fullpath = File.join(settings.root, "graphs", "#{filename}.dot")

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

    body output
  end

  get /\/(index\..*)*/i do
    haml :index,
      :layout => :layout,
      :layout_options => { views:  "template" }
  end

  get "/:type/" do |type|
    haml :index,
      :views => type,
      :layout => :layout,
      :layout_options => { views:  "template" }
  end

  get "/:type/:filename.html" do |type, filename|
    haml filename.to_sym,
      :views => type,
      :layout => :layout,
      :layout_options => { views: "template" }
  end
end

case ENV['RACK_ENV']
  when "ami_server"
    map("/ci/2.04_programming") do
      run SlideServer
    end
  else
    map("/") do
      run SlideServer
    end
end
