class LogLineParser
  def initialize(line)
    @line = line
    @log_level, @message = @line.split(']: ', 2)

    # remove the leading `[`
    @log_level = @log_level.sub('[', '').downcase
    @message.strip!
  end

  def message
    @message
  end

  def log_level
    @log_level
  end

  def reformat
    "#{self.message} (#{self.log_level})"
  end
end
