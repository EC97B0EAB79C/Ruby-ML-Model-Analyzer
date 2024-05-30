module DirUtils
  def self.dir_entries(path)
    Dir.entries(path).select do |entry|
      File.directory?(File.join(path, entry)) && entry != "." && entry != ".."
    end
  end
end
