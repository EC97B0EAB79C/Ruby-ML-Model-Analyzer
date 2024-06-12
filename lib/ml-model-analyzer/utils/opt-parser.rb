# Load libraries
require "optparse"

##
# @class OptParser
# Class parsing command-line options
#
class OptParser
  def self.parse
    options = {}

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: ml-model-analyzer.rb [options]"

      # Set model repository for a session
      opts.on("--model_repository=PATH", "Specify the model repository path") do |path|
        SessionConfig.model_repository_path = path
      end

      # Enable debug logs
      opts.on("-d", "--debug", "Show debug logs") do
        Log.log_level = Logger::DEBUG
      end

      # Help message
      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    # Starts parser
    begin
      options[:cmd] = parser.parse!

      # Rescue error for invalid option
    rescue OptionParser::MissingArgument => e
      Log.log.error e.message
      Log.log.error parser
      puts e.message
      puts parser
      exit
    end
    options
  end
end
