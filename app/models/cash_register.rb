class CashRegister
  attr_accessor :client
  def initialize(queue, market)
    @client
    @queue = queue
    @market = market
  end

  def next_client
    @client = @queue.remove if @queue.num_clients > 0
  end

  def next_iteration
    unless @client.nil?
      @client.subtraction_time_cash_register
      @client.sum_wait_time
      if @client.time_cash_register <= 0
        @market.client_attended(client)
        @client = nil
      end
    end
  end
end
