# frozen_string_literal: true

require_relative 'menu'
require_relative 'tasks/task01'
require_relative 'tasks/task02'
require_relative 'tasks/task03'
require_relative 'tasks/task04'
require_relative 'tasks/task05'

def main
  menu = Menu.new('OOP LABORATORY WORK 1')

  menu.add_task(Task01.new)
  menu.add_task(Task02.new)
  menu.add_task(Task03.new)
  menu.add_task(Task04.new)
  menu.add_task(Task05.new)

  menu.run
end

main if __FILE__ == $PROGRAM_NAME
