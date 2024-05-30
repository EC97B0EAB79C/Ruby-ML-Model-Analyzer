##
# @Class SessionConfig
# Saves config for a session
# Loads data from AppConfig if session config is not set
#
class SessionConfig
  @model_repository_path = nil

  # Model repository
  def self.model_repository_path = @model_repository_path || AppConfig.model_repository_path
  def self.model_repository_path=(data)
    @model_repository_path = data
  end
end
