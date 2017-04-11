# Database configuration file
db_config_file = File.join(File.dirname(__FILE__), '..', 'app', 'database.yml')

# Creating database context
if File.exist?(db_config_file)
  config = YAML.safe_load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end

# Get routes
ROUTES = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))

# Connecting all our framework's classes
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each { |file| require file }

# Connecting all our framework's files
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each { |file| require file }

# If there is a database connection, running all the migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'app', 'db', 'migrations'))
end
