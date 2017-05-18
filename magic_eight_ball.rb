input = ARGV

@answers = ['you may rely on it',
'as I see it, yes', 'yost likely', 'outlook good', 'yes', 
'signs point to yes', 'reply hazy try again', 'ask again later',
'better not tell you now', 'cannot predict now', 
'concentrate and ask again', 'don\'t count on it', 
'my reply is no', 'my sources say no', 'outlook not so good', 'very doubtful']

@user_answers = []



def get_answer
    answer_set = @answers + @user_answers
    answer_set.sample
end

def validate_answer(answer)
    num_of_answers = @user_answers.length
    puts num_of_answers
    !!(answer =~ /[1-#{num_of_answers}]/)
end

def print_all
    puts "\n--------------------"
    puts "All Magic Eight Ball answers \n"
    answer_set = @answers + @user_answers
    answer_set.each_with_index { |answer, index| puts "#{index + 1}. #{answer.capitalize}" }
    display_menu
end

def remove_answer
    puts "List of user submitted answers \n\n"
    if @user_answers.empty?
        puts "No user answers to remove."
        display_menu
    else
        @user_answers.each_with_index { |answer, index| puts "#{index + 1}. #{answer}" }

        puts "\n Select the number you want to delete"
        answer = gets.chomp

        if validate_answer(answer)
            @user_answers.delete_at(answer.to_i - 1)
            puts "The answer has been deleted"
            display_menu
        else
            puts "Invalid response, try again"
            remove_answer
        end
    end
end

def add_answer

    puts "What answer would you like to add to the Magin Eight Ball?"
    answer = gets.chomp


    if @answers.include?(answer.downcase)
        puts "That answer already exists"
    else
        @user_answers << answer
        puts "Your answer has been added to the list of answers. \n\n"
    end
    

    display_menu
end

def get_question
    puts "What is your yes or no question?"
    question = gets.chomp
    puts "That is an interesting question, let me think about it..."
    sleep(1)
    puts "thinking..."
    sleep(1)
    puts "thinking... \n\n"
    sleep(1)


    puts "#{get_answer.capitalize} \n\n"

    display_menu
end

def display_menu
    puts "------------------------------------------"
    puts "What would you like to do \n\n"
    puts "1) Ask a question"
    puts "2) Add an answer to the Magic Eight Ball"
    puts "3) Remove one or your answers"
    puts "4) Quit"

    answer = gets.chomp

    case answer
        when "1"
            get_question
        when "2"
            add_answer
        when "3"
            remove_answer
        when "4"
            puts "Goodbye! \n\n"
        when "reset"
            @user_answers.clear
            display_menu
        when "answers" 
            print_all
        else
            puts "Invalid input, try again"
            display_menu
    end
end

def welcome
    puts "\n\n  Welcome to the MAGIC EIGHT BALL! \n\n"

    display_menu
end

def eval_command_line_input(input)
    if input.first == "answers"
        input.clear
        add_answer
    else
        input.clear
        welcome
    end
    
end

eval_command_line_input(input)
