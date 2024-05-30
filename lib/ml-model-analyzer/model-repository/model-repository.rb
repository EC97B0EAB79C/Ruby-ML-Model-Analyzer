class ModelRepository
  def initialize(model_repository_path)
    @model_repository_path = model_repository_path
    @models = load
    puts @models
  end

  def load
    DirUtils.dir_entries(@model_repository_path).map { |model_name|
      Model.new model_name File.join(@model_repository_path, model_name)
    }
  end
end
