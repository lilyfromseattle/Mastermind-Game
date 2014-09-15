require 'colorize'
class Mastermind
	attr_accessor :winning_pattern
	def initialize(winning_pattern)
	@winning_pattern = winning_pattern
	@guesses = []
	@past_guesses = []
	@reds = 0
	@blues = 0
	@counter = 0
	@rows = []
	@row_number = 0

	def make_row(difficulty)
		if difficulty.downcase == "easy"
			multiply_rows(12)
			@row_number = 12
		elsif difficulty.downcase == "medium"
			multiply_rows(10)
			@row_number = 10
		elsif difficulty.downcase == "hard"
			multiply_rows(8)
			@row_number = 8
		end
	end

  def print_row
    puts @rows
  end

	def multiply_rows(x)
		for y in 1..x
			@rows << "0 0 0 0   #{"O".colorize(:red)} #{"O".colorize(:blue)}"
		end
	end

	def colorize_guess(guess)
		if guess == "red"
			guess = "0".colorize(:red)
		elsif guess == "orange"
			guess = "0".colorize(:orange)
		elsif guess == "yellow"
			guess = "0".colorize(:yellow)
		elsif guess == "green"
			guess = "0".colorize(:green)
		elsif guess == "blue"
			guess = "0".colorize(:blue)
		elsif guess == "black"
			guess = "0".colorize(:black)
		elsif guess == "white"
			guess = "0".colorize(:white)
		elsif guess == "tan"
			guess = "0".colorize(:tan)
		elsif guess.downcase == "exit"
			puts "Thanks for playing!"
			puts "Goodbye!"
			exit(0)
    else
      puts "You must enter a color name!"
		end
	end

	def pegs(peg)
		for guess in @guesses
			if guess == peg and @guesses.index(guess) == @winning_pattern.index(peg)
				@reds = @reds + 1

		  elsif guess == peg and @guesses.index(guess) != @winning_pattern.index(peg)
				@blues = @blues + 1
			end
		end
	end



	def play
		puts "Welcome to Mastermind!"
		puts "Enter difficulty level (Enter 'easy', 'medium', or 'hard'):"
		difficulty = gets.chomp
    make_row(difficulty)
		while @guesses != @winning_pattern
      print_row
			puts "Enter 1st Guess:"
			guess_1 = gets.chomp
      guess_1 = colorize_guess(guess_1)
			@guesses.push(guess_1)

			puts "Enter 2nd Guess:"
			guess_2 = gets.chomp
      guess_2 = colorize_guess(guess_2)
			@guesses.push(guess_2)

			puts "Enter 3rd Guess:"
			guess_3 = gets.chomp
      guess_3 = colorize_guess(guess_3)
			@guesses.push(guess_3)

			puts "Enter 4th Guess:"
			guess_4 = gets.chomp
      guess_4 = colorize_guess(guess_4)
			@guesses.push(guess_4)

			for peg in @winning_pattern
					pegs(peg)
			end
      @reds = @reds / 2
      @blues = @blues / 2


			@rows[@row_number - @counter] = @guesses.join(" ") + "   #{@reds.to_s.colorize(:red)} #{@blues.to_s.colorize(:blue)}"

      if @rows[0] != "0 0 0 0   #{"O".colorize(:red)} #{"O".colorize(:blue)}"
        puts "You lose!"
        puts "The pattern was #{@winning_pattern.join(" ")}."
        puts "Thanks for playing!"
        exit(0)
      end

      if @guesses.join(" ") == @winning_pattern.join(" ")
        puts "You win!"
        puts "The pattern was #{@winning_pattern.join(" ")}."
        puts "Thanks for playing!"
        exit(0)
      end

      @counter = @counter + 1
      @guesses = []
			@reds = 0
			@whites = 0


		end
	end
end
end

def random_color(array)
	array[rand(0..5)]
end

colors = [:red, :orange, :yellow, :green, :blue, :black]
my_game = Mastermind.new(["0".colorize(random_color(colors)),"0".colorize(random_color(colors)),"0".colorize(random_color(colors)),"0".colorize(random_color(colors))])
my_game.play
