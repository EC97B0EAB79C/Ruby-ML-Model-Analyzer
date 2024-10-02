require "fileutils"
require "yaml"

class Workspace
  def initialize(workspace_path, model_repository)
    @workspace_path = workspace_path
    @model_repository = model_repository
    create_workspace
  end

  def create_workspace()
    Log.log.debug "Creating workspace"
    execute_dir = Dir.pwd
    Dir.chdir @workspace_path
    @model_repository.models.each do |model|
      create_workdir(model)
    end
    Dir.chdir execute_dir
    Log.log.debug "Created workspace"
  end

  def create_workdir(model)
    begin
      FileUtils.mkdir_p model.name
      Dir.chdir model.name
      FileUtils.rm_r Dir.glob("./*")
      FileUtils.cp model.path, "."
      create_parameter_file model.parameter
      Log.log.debug "> Workspace [#{model}] created"
      Dir.chdir @workspace_path
    rescue => e
      Log.log.error e
      Dir.chdir @workspace_path
      FileUtils.rm_r Dir.glob(model.name)
    end
  end

  def create_parameter_file(parameters)
    parameters.keys.each do |key|
      write_yaml "#{key}.yaml", parameters[key]
    end
  end

  def write_yaml(file_name, parameters)
    File.open(file_name, "w") do |f|
      f.write parameters.to_yaml
    end
  end
end
