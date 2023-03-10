require "./player"

class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @total = @num1 + @num2
  end

  def ask_question(player)
    puts "#{player}: What is #{@num1} + #{@num2} ="
  end

  def correct(answer)
    @total == answer.to_i
  end
end