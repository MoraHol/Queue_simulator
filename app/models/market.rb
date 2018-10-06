require_relative 'cash_register'
require_relative 'queue'
class Market
    def initialize
        @cash_register = []
        @clients = []
    end
    def create_cash_register (n_cahs_register, type_simulation)
        if type_simulation == :M_M
            create_cash_register_M_M(n_cahs_register)
        elsif type_simulation == :M_1
            create_cash_register_M_1(n_cahs_register)
        end
    end
    def next
    end
    def next_iteration
    end
    protected
    def create_cash_register_M_M(n)
        for i in (0..n - 1) do
            @cash_register[i] = CashRegister.new(Queue.new)
        end
    end
    def create_cash_register_M_1(n)
        queue = Queue.new
        for i in (0..n - 1) do
            @cash_register[i] = CashRegister.new(queue)
        end
    end
end