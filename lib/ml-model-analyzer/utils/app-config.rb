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
    @config ||= load_config_file
  end

  # Model repository
  def self.model_repository_path = load_config["model_repository"]
  def self.support_matrix_path = load_config["support_matrix"]

  private

  def self.load_config_file
    begin
      YAML.load_file(@config_path)
    rescue StandardError => e
      Log.log.error "AppConfig: Error loading config file: #{e.message}"
      {}
    end
  end
end
