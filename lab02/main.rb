# frozen_string_literal: true

require_relative 'text_processor/text_menu'
require_relative 'converter/converter_menu'
require_relative 'calculator/user_interface'
require_relative 'history_manager'

class MainMenu
  def initialize
    @history = HistoryManager.new
  end

  def run
    loop do
      puts "\n#{'=' * 50}"
      puts 'OOP LABORATORY WORK 2: CLASSES & METHODS'.center(50)
      puts '=' * 50
      puts '1. Program 1: Text Processor (TextProcessor)'
      puts '2. Program 2: Unit Converter (Temp, Length, Weight)'
      puts '3. Program 3: Arithmetic Calculator (Calculator)'
      puts '4. View Session History (Saved Results)'
      puts '0. Exit'
      puts '=' * 50
      print 'Your choice: '

      choice = $stdin.gets&.strip

      case choice
      when '1'
        TextMenu.run(@history)
      when '2'
        ConverterMenu.run(@history)
      when '3'
        UserInterface.run(@history)
      when '4'
        @history.display
      when '0'
        puts "\nExiting Laboratory Work 2. Goodbye!"
        break
      else
        puts 'Invalid choice! Please choose an option from 0 to 4.'
      end
    end
  end
end

MainMenu.new.run if __FILE__ == $PROGRAM_NAME
