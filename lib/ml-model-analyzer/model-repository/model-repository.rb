require "json"

class ModelRepository
  def initialize(model_repository_path)
    Log.log.debug "Creating model repository"
    @model_repository_path = model_repository_path
    @model_data_path = File.join(@model_repository_path, "model_data")
    @models = load
    Log.log.debug "> Model Repository of #{@models.length} created"
  end

  def load
    Log.log.debug "> Loading models"
    DirUtils.file_entries(@model_data_path).map { |model_data_file|
      file_data = File.read File.join(@model_data_path, model_data_file)
      Model.new JSON.parse(file_data), @model_repository_path
    }
  end

  def models
    @models
  end

  def summary
    models.map { |model|
      "| " + model.detail.join(" | ") + " |"
    }.sort
  end

  def result
    models.map { |model|
      "| " + model.result.join(" | ") + " |"
    }.sort
  end
end
