module DirUtils
  def self.dir_entries(path)
    Dir.entries(path).select do |entry|
      File.directory?(File.join(path, entry)) && entry != "." && entry != ".."
    end
  end

  def self.file_entries(path)
    Dir.entries(path).select do |entry|
      File.file?(File.join(path, entry))
    end
  end
end
