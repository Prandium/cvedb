require 'fidius-cvedb/version'

module FIDIUS
  module CveDb
    GEM_BASE = File.join(ENV['GEM_HOME'], 'gems', "fidius-cvedb-#{VERSION}", 'lib')
    
    # If the used Rails version is 3 or beyond we use railties to load the rake
    # tasks. Otherwise they are symlinked.
    require 'fidius-cvedb/railtie' unless Rails.version.to_i < 3
    
    require (File.join GEM_BASE, 'models', 'fidius', 'cve_db', 'cve_connection.rb')
    Dir.glob(File.join GEM_BASE, 'models', 'fidius', 'cve_db', '*.rb') do |rb|
      require rb
    end
  end
end