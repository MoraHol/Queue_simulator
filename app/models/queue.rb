require_relative 'cash_register'
class Queue
  attr_accessor :clients
  def initialize
    @clients = []
  end

  def add(client)
    @clients.push(client)
  end

  def remove
    @clients.shift
  end

  def num_clients
    @clients.size
  end
end
