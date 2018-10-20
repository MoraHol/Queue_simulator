require_relative 'cash_register'
require_relative 'queue'
require_relative 'client'
class Market
  def initialize
    @cash_register = []
    @queues = []
    @clients_attended = []
  end

  def create_cash_register(n_cahs_register, type_simulation)
    if type_simulation == :M_M
      create_cash_register_M_M(n_cahs_register)
    elsif type_simulation == :M_1
      create_cash_register_M_1(n_cahs_register)
    end
  end

  def enter_clients(num_clients)
    for i in 0..num_clients - 1 do
      client = Client.new
      client.choose_queue(@queues).add(client)
    end
    client_to_cash_register
  end

  def next_iteration
    @queues.each do |queue|
      queue.clients.each(&:sum_wait_time)
    end
    @cash_register.each(&:next_iteration)
  end

  def client_attended(client)
    @clients_attended.push(client)
  end

  protected

  def create_cash_register_M_M(n)
    for i in (0..n - 1) do
      @queues[i] = Queue.new
      @cash_register[i] = CashRegister.new(@queues[i], self)
    end
  end

  def create_cash_register_M_1(n)
    @queues[0] = Queue.new
    for i in (0..n - 1) do
      @cash_register[i] = CashRegister.new(@queues[0], self)
    end
  end

  def client_to_cash_register
    @cash_register.each do |cash|
      next unless cash.client.nil?
      cash.next_client
    end
  end
end
