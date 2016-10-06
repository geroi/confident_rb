class LoggerAdapter

  def initialize target 
    @target = target
  end

  def info message
        @target << "[INFO] #{Time.now.strftime('%d.%m.%Y %H:%M:%S')} - #{message}\n"
  end

end

class IrcLogger
  def <<
  end
end

$log = LoggerAdapter.new(File.open('./log.txt','a+'))
$log.info('new message')