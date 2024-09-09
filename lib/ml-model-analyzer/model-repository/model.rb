##
# @Class Model
# Model class containing model config and versions
#
class Model
  def initialize(model_data)
    @model_data = model_data
    @name = model_data["name"]
    @path = model_data["path"]
    @framework = model_data["framework"]
    @source = model_data["source"]
  end

  # String representation for debugging
  def to_s
    "Model: #{@name} (#{@framework})"
  end

  def detail
    [@name, @framework, @source]
  end

  # def execute_model
  #   execution_string = "#{SessionConfig.venv_path}#{config["framework"]}/bin/python3 "
  #   execution_string += "#{config["script"]}"
  #   Log.log.info execution_string
  #   # `#{execution_string}`ze
  # end
end
