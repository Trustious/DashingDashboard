class MessageHandler

    attr_reader :timeoutsCount
    attr_writer :timeoutsCount  

    def initialize()
        @timeoutsCount = 0
    end

    @@instance = nil
    def self.getInstance()
        if @@instance.nil?
            @@instance = MessageHandler.new
        end
        @@instance
    end

    def self.handle(data)
        getInstance().handle(data)
    end

    def handle(data)
        if data['metric'] == 'timeout'
            self.timeoutsCount += 1
            send_event('timeouts', {operation: 'set', value: self.timeoutsCount})
        elsif data['metric'] == 'error'
            send_event('timeouts', {operation: 'increment'})
        end
    end

end
