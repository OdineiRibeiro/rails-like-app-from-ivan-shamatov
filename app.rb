require 'yaml'
require 'erb'
require 'pry'

ROUTES = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml')))

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each { |file| require file }

class App
  attr_reader :router

  def initialize
    @router = Router.new ROUTES
  end

  def self.root
    File.dirname(__FILE__)
  end

  def call(env)
    result = router.resolve env
    [result.status, result.headers, result.content]
  end
end
