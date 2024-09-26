##
# @Class SessionConfig
# Saves config for a session
# Loads data from AppConfig if session config is not set
#
class SessionConfig
  @model_repository_path = nil
  @venv_path = nil

  # Model repository
  def self.model_repository_path
    @model_repository_path || AppConfig.model_repository_path
  end
  def self.model_repository_path=(data)
    @model_repository_path = data
  end

  # Venv
  def self.venv_path
    @venv_path || AppConfig.venv_path
  end
  def self.venv_path=(data)
    @venv_path = data
  end

  # Workspace
  def self.workspace_path
    @workspace_path || AppConfig.workspace_path
  end
  def self.workspace_path=(data)
    @workspace_path = data
  end
end
