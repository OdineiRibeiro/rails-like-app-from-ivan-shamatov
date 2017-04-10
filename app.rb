require 'yaml'
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml')))

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
