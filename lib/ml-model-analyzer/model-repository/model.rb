##
# @Class Model
# Model class containing model config and versions
#
class Model
  attr_reader :name, :path, :framework, :parameter, :source
  attr_accessor :result

  def initialize(model_data, model_repository_path)
    @model_data = model_data
    @name = model_data["name"]
    @file_name = model_data["file_name"]
    @path = File.join model_repository_path, @file_name
    @framework = model_data["framework"]
    @source = model_data["source"]
    if @source.instance_of? Array
      @source = @source[0]
    end
    @parameter = model_data["parameter"]
    @result = {}
  end

  # String representation for debugging
  def to_s
    "Model: #{@name} (#{@framework})"
  end

  def summary
    [@name, @framework]
  end

  def detail
    [@name, @framework, @file_name, [@source].join(", ")]
  end

  def show_result(process = nil)
    [@name, @framework] + @result.values_at(*process)
  end

  # def execute_model
  #   execution_string = "#{SessionConfig.venv_path}#{config["framework"]}/bin/python3 "
  #   execution_string += "#{config["script"]}"
  #   Log.log.info execution_string
  #   # `#{execution_string}`ze
  # end
end
