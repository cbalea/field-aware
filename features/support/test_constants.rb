require 'yaml'


module TestConstants

  @environments = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)),'environments.yml'))


  def self.url
    @environments['url']
  end

end

