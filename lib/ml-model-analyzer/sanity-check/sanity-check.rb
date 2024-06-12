class SanityCheck
  def initialize
  end

  def check(model, hw)
    Log.log.info "Sanity checking #{model.name}"
    Log.log.debug SupportMatrix.op_list(hw, model.config["framework"])
  end
end
