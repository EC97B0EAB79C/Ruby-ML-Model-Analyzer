##
# @Class SessionConfig
# Saves config for a session
# Loads data from AppConfig if session config is not set
#
class SessionConfig
  @model_repository = nil

  # Model repository
  def self.model_repository = @model_repository || AppConfig.model_repository
  def self.model_repository=(data)
    @model_repository = data
  end
end
