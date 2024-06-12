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

  # Loads model versions in model directory
  def version
    @version ||= begin
        DirUtils.dir_entries(@path).select { |entry|
          entry != "config"
        }
      end
  end

  # String representation for debugging
  def to_s
    "Model: #{@name} #{config} #{version}"
  end
end
