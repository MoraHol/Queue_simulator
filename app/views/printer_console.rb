class PrinterConsole
  def initialize( queue_simulator)
    @queue_simulator = queue_simulator
    @market = queue_simulator.market
  end

  def print_prom
    puts "el tiempo promedio de espera de los clientes fue de: #{@queue_simulator.calculation_time_wait_clients} minutos"
    puts "se atendieron #{@queue_simulator.market.clients_attended.size} clientes"
  end

  def print_sml
    @market.cash_register.each do
      print '|C|  '
    end
    print "\n"
    @market.cash_register.each do |cash|
      if cash.client.nil?
        print '     '
      else
        print "#{cash.client.name}   "
      end
    end
    print "\n\n"
    print_queues
    print "\n------------------------------------------\n\n"
  end

  private

  def print_queues
    (0..longest_queue_size - 1).each do |i|
      @market.queues.each do |queue|
        print '    ' if @queue_simulator.type_simulation == :M_1
        if queue.clients[i].nil?
          print '|  | '
        else
          print "|#{queue.clients[i].name}| "
        end
      end
      print "\n"
    end
  end

  def longest_queue_size
    longest_queue = @market.queues.first
    @market.queues.each do |queue|
      longest_queue = queue if queue.num_clients > longest_queue.num_clients
    end
    longest_queue.num_clients
  end
end
