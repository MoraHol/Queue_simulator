class PrinterConsole
  def initialize(simulator)
    @simulator = simulator
  end

  def print_prom
    puts "el tiempo promedio de espera de los clientes fue de: #{@simulator.calculation_time_wait_clients}"
  end

  def print_sml; end
end
