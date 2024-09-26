require "fileutils"

class Workspace
  def initialize(workspace_path, model_repository)
    @workspace_path = workspace_path
    @model_repository = model_repository
    create_workspace
  end

  def create_workspace()
    Dir.chdir @workspace_path
    @model_repository.models.each do |model|
      FileUtils.mkdir_p model.name
      Dir.chdir model.name
      FileUtils.rm_r Dir.glob("./*")
      FileUtils.cp model.path, "."
      Dir.chdir "../"
    end
  end
end
