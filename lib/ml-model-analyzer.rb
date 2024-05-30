# Load utils library
require_relative "./ml-model-analyzer/utils/log.rb"
require_relative "./ml-model-analyzer/utils/opt-parser.rb"
require_relative "./ml-model-analyzer/utils/app-config.rb"
require_relative "./ml-model-analyzer/utils/session-config.rb"

begin
  options = OptParser.parse
  Log.log.info "Started model analyzer"
end
