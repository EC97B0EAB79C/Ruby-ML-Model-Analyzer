class SupportMatrix
  @cached_matrices = {}

  def self.hw_matrix(hw)
    @cached_matrices[hw] ||= {}
  end

  def self.op_list(hw, framework)
    hw_matrix(hw)[framework] ||= load_matrix_file(hw, framework)
  end

  private

  def self.load_matrix_file(hw, framework)
    file_path = "#{SessionConfig.support_matrix_path}/#{hw}/#{framework}.txt"
    begin
      Log.log.debug "SupportMatrix: Loading #{hw} #{framework}"
      File.readlines(file_path, chomp: true)
    rescue StandardError => e
      Log.log.error "SupportMatrix: Error loading #{hw} #{framework}: #{e.message}"
      []
    end
  end
end
