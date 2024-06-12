class SupportMatrix
  @op_list = {}

  def self.hw_matrix(hw)
    @op_list[hw] ||= {}
  end
  def self.matrix(hw, framework)
    hw_matrix(hw)[framework] ||= begin
        Log.log.debug "SupportMatrix: Loaded #{hw} #{framework}"
        File::readlines(
          "#{SessionConfig.support_matrix_path}/#{hw}/#{framework}.txt",
          chomp: true,
        )
      end
  end
end
