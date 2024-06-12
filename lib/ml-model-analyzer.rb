# Load utils libraries
require_relative "./ml-model-analyzer/utils/log.rb"
require_relative "./ml-model-analyzer/utils/opt-parser.rb"
require_relative "./ml-model-analyzer/utils/app-config.rb"
require_relative "./ml-model-analyzer/utils/session-config.rb"
require_relative "./ml-model-analyzer/utils/dir-utils.rb"

# Load model libraries
require_relative "./ml-model-analyzer/model-repository/model.rb"
require_relative "./ml-model-analyzer/model-repository/model-repository.rb"

# Load sanity check libraries
require_relative "./ml-model-analyzer/sanity-check/sanity-check.rb"
require_relative "./ml-model-analyzer/sanity-check/support-matrix.rb"

begin
  options = OptParser.parse
  Log.log.info "Started model analyzer"

  model_repository = ModelRepository.new SessionConfig.model_repository_path
  Log.log.debug "#{model_repository}"

  sanity_check = SanityCheck.new

  model_repository.model_names.each do |name|
    Log.log.debug "#{model_repository.model name}"
    sanity_check.check(model_repository.model(name), "hw1")
  end
end
