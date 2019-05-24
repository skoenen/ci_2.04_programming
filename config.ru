# config.ru (run with `rackup`)

require 'sinatra/base'
require 'sprockets'
require 'ruby-graphviz'

require './lib/slideserver/slide_server'


case ENV['RACK_ENV']
  when "ami_server"
    map("/ci/2.04_programming") do
      run SlideServer::Server
    end
  else
    map("/") do
      run SlideServer::Server
    end
end
