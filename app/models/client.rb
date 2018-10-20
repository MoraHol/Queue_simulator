require_relative 'queue'

class Client
  attr_accessor :name, :time_cash_register, :wait_time
  def initialize
    @wait_time = 0
    @name
    @time_cash_register
    assign_name
    define_time_cash_register
  end

  def choose_queue(queues)
    shorter_queue = queues.first
    queues.each do |queue|
      shorter_queue = queue if queue.num_clients < shorter_queue.num_clients
    end
    shorter_queue
  end

  def sum_wait_time
    @wait_time += 1
  end

  def subtraction_time_cash_register
    @time_cash_register -= 1
  end

  private

  def assign_name
    letters = %w[a b d e f g h i j k l m n o p r s t u v x y z]
    @name = letters[rand(letters.size)] + letters[rand(letters.size)]
  end

  def define_time_cash_register
    @time_cash_register = rand(4..25)
  end
end
