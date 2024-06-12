# Load libraries
require "yaml"
require "fileutils"

##
# @Class AppConfig
# Loads configuration from a YAML file
#
class AppConfig
  @config_path = "#{File.expand_path("~")}/.rml-model-analyzer/config.yaml"
  @config = nil

  ##
  # Loads the application configuration from a YAML file if not already loaded.
  #
  # @return [Hash] The loaded configuration as a hash.
  #
  def self.load_config
    @config ||= begin
        unless File.file? @config_path
          Log.log.info "Config file dose not exists. Creating in '#{@config_path}'"
          FileUtils.mkdir_p File.dirname @config_path
          FileUtils.touch @config_path
        end
        YAML.load_file(@config_path) || {}
      end
  end

  # Model repository
  def self.model_repository_path = load_config["model_repository"]
  def self.support_matrix_path = load_config["support_matrix"]
end
