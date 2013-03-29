require 'sinatra/base'
require 'haml'
require 'sass'
require 'coffee-script'
require 'rdiscount'
require 'json'

# Sinatra based web UI
class KugaevskyRu < Sinatra::Base

  # @macro [attach] sinatra.set
  #   @overload set "$1", value
  # @method set_root
  # @param [String] path path to root directory
  # Set root app directory
  set :root, File.dirname(__FILE__)

  # @method set_public
  # @param [String] path set directory for public folder
  # Set public folder for static files
  set :public_folder, "#{settings.root}/static"

  # @method set_sessions
  # @param [Boolean] sessions set sessions options
  # Turn on sessions
  set :sessions, true

  # @method set_logger
  # @param [Boolean] logging show log
  # Turn on logging and set log level to dedug for development environment
  set :logging, false

  configure :development do
    set :logging, true
  end

  before do

  end

  # Display login page
  #
  # @macro [attach] sinatra.get
  #   @overload get "$1"
  # @method get_root
  get '/' do
    haml :index
  end

  # @method get_coffee
  # Render coffeescripts
  get "/scripts.js" do
    coffee :scripts
  end

  # @method get_sass
  # Render SASS styles
  get "/styles.css" do
    sass :styles
  end
end