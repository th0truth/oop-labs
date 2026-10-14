# frozen_string_literal: true

require_relative 'input_helper'

class Menu
  def initialize(title = 'LABORATORY WORK 1')
    @title = title
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def run
    loop do
      display
      choice = InputHelper.read_int_in_range('Your choice: ', 0, @tasks.size)

      if choice.zero?
        puts "\nExiting application. Goodbye!"
        break
      end

      task = @tasks[choice - 1]
      execute_task(task)
      InputHelper.pause
    end
  end

  private

  def display
    puts "\n#{'=' * 40}"
    puts @title.center(40)
    puts '=' * 40

    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task.title}"
    end

    puts '0. Exit'
    puts '=' * 40
  end

  def execute_task(task)
    puts "\n--- [ #{task.title} ] ---"
    task.execute
  rescue StandardError => e
    puts "\nAn error occurred while executing task: #{e.message}"
  end
end