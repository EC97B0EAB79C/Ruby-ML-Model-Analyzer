##
# @Class Model
# Model class containing model config and versions
#
class Model
  def initialize(name, path)
    @name = name
    @path = path
  end

  # Loads config from file at model directory
  def config
    @config ||= YAML.load_file "#{@path}/config.yaml"
  end

  # String representation for debugging
  def to_s
    "Model: #{@name} #{config}"
  end
end
