require 'sinatra'
require 'haml' # template engine
require 'json'

# control part of MVC
# an HTTP method paired with a URL-matching pattern
get '/' do
  # page variable
  @version = RUBY_VERSION
  @os = RUBY_PLATFORM
  @env = {}
  ENV.each do |key, value|
    begin
      hash = JSON.parse(value)
      @env[key] = hash
    rescue
      @env[key] = value
    end
  end
  
  
  #VCAP_APPLICATION contains useful information about a deployed application.
  appInfo = @env["VCAP_APPLICATION"]

  services = @env["VCAP_SERVICES"]

  # render template
  haml :hi
end
