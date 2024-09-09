require "json"

class ModelRepository
  def initialize(model_repository_path)
    @model_repository_path = model_repository_path
    @model_data_path = File.join(@model_repository_path, "model_data")
    @models = load
  end

  def load
    DirUtils.file_entries(@model_data_path).map { |model_data_file|
      file_data = File.read File.join(@model_data_path, model_data_file)
      Model.new JSON.parse file_data
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
end
