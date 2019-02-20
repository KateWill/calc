
# puts result
# error checking
# user input and modifiers should be checked for proper input type
# the result should set first_number and allow for another modifier and last number so result continues to build until the user decides to clear the calculator
# - make + - * / work
  # + work
  # - work
  # * work
  # / work
# - make clear work
# EXIT - will end the program

@equation = []
@solution = 0
@inital_equation = true
@calc_history = []

def menu 
  puts
  puts "Choose an optin below:"
  puts
  puts "1) Continue to calculator"
  puts "2) Clear Work"
  puts "3) View calculator history"
  puts "4) Exit"
end

def menu_input
  menu
  input = gets.to_i
  
  case input
    when 1 
      do_math
    when 2
      clear_work
    when 3 
      view_history
    when 4
      puts "Goodbye!"
    else
      puts "Invalid input (please enter a number (1-3)"
  end
end

def clear_work
  @solution = 0
  @inital_equation = true
  @calc_history << ["cleared"]
  puts "SUCCESS: Calculator cleared!"
  menu_input
end

# take the first number
def num_input
  puts "Type number:"
  num = gets.chomp
  check = num.to_i
  checkf = num.to_f
  if num == (check.to_s || checkf.to_s)
    @equation << num.to_f
  else
    puts
    puts "ERROR: Invalid entry, please enter a number."
    puts
    num_input
  end
end

# take modifier
def modifier_input
  valid_modifiers = ['-', '+', '*', '/']
  puts "Type in modifier(-, +, *, /):"
  modifier = gets.chomp
  if valid_modifiers.include? modifier
    @equation << modifier
  else
    puts
    puts "ERROR: Invalid entry, please try again."
    puts
    modifier_input
  end
end

def print_solution
  puts
  puts "*********************"
  puts "#{@equation[0].round(2)} #{@equation[1]} #{@equation[2].round(2)} = #{@solution.round(2)}"
  puts "*********************"
  puts 
end

def view_history
  if @calc_history.length > 0 
    # p @calc_history
    @calc_history.each_with_index { |item,index|
      puts
      if item.length > 1
      puts "#{index + 1}) #{item[0]} #{item[1]} #{item[2]} = #{item[3]}"
      else
        puts "Cleared calculator"
      end
    }
  else
    puts
    puts "*No history exists."
  end
  menu_input
end

def do_math 
  # p @inital_equation
  if @inital_equation == true
    num_input
    modifier_input
    num_input
    @inital_equation = false
    # p @inital_equation
    
  else
    puts
    puts "#{@solution.round(2)}"
    @equation[0] = @solution
    modifier_input
    num_input 
  end
    first_num = @equation[0]
    modifier = @equation[1]
    second_num = @equation[2]

  # p first_num 
  # p modifier 
  # p second_num 
    
  case modifier 
    when "-"
    # Do subtraction
      @solution = first_num - second_num
      print_solution
    when "+"
    # Do addition
    @solution = first_num + second_num
      print_solution
    when "*"
    # Do multiplication
      @solution = first_num * second_num
      print_solution
    when "/"
    # Do division
      @solution = first_num / second_num
      print_solution
    end
    @calc_history << [@equation[0].round(2), @equation[1], @equation[2].round(2), @solution.round(2)]
    @equation.clear
    menu_input
end



# first_num_input
# modifier_input
# second_num_input


menu_input
