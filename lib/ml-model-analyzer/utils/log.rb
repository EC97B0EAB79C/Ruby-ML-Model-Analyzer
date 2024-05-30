# Load libraries
require "logger"

##
# @class Log
# Class for singleton logger instance.
#
class Log
  @log_level = Logger::INFO

  ##
  # Sets the logging level for the logger.
  #
  # @param [Integer] level The log level.
  #
  def self.log_level=(level)
    @log_level = level
  end

  ##
  # Provides access to the logger instance. Initializes the logger if it has not been created.
  #
  # @return [Logger] The Logger instance.
  #
  def self.log
    if @logger.nil?
      @logger = Logger.new STDOUT
      @logger.level = @log_level
      @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    end
    @logger
  end
end
