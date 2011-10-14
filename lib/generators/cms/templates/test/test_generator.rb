class CmsGeneratorTest < Rails::Generators::TestCase
  tests CmsGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
end