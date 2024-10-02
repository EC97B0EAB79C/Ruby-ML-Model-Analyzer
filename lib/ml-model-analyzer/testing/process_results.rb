require "yaml"

class ProcessResults
  def self.process(model_repository, result_path)
    results = YAML.load_file result_path

    model_repository.models.each do |model|
      model.result = results[model.name]
    end
  end
end
