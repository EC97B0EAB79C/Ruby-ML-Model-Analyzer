class Model
  def initialize(name, path)
    @name = name
    @path = path
  end

  def config
    @config ||= "test_config"
  end

  def version
    @version ||= "test_version"
  end

  def to_s
    "Model: #{@name} #{config} #{version}"
  end
end
