
class CashRegister
  attr_accessor :client
    def initialize(queue)
        @client
        @queue = queue
    end

    def next_client
      if @queue.num_clients > 0
        @client = @queue.remove
      end
    end

    def next_iteration
      if @client != nil
        @client.subtraction_time_cash_register
        @client.sum_wait_time
        if @client.time_cash_register == 0
          @client=nil
        end
      end
    end
end
