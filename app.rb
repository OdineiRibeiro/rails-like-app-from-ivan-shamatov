require 'yaml'
ROUTES = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml')))

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each {|file| require file }

class App
  attr_reader :router

  def initialize
    @router = Router.new ROUTES
  end

  def call(env)
    result = router.resolve env
    [result.status, result.headers, result.content]
  end
end
