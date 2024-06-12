##
# @Class ModelRepository
# ModelRepository class containing list of models in model repository
#
class ModelRepository
  def initialize(model_repository_path)
    @model_repository_path = model_repository_path
    @models = load
  end

  attr_reader :model_names

  def load
    @model_names = DirUtils.dir_entries @model_repository_path
    @model_names.map { |model_name|
      [model_name, Model.new(model_name, File.join(@model_repository_path, model_name))]
    }.to_h
  end

  def model(name)
    @models[name]
  end

  def to_s
    "Model Repository: #{@model_repository_path} #{@model_names}"
  end
end
