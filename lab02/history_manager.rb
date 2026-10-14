# frozen_string_literal: true

class HistoryManager
  Entry = Struct.new(:timestamp, :category, :details)

  attr_reader :entries

  def initialize
    @entries = []
  end

  def add(category, details)
    @entries << Entry.new(Time.now.strftime('%H:%M:%S'), category, details)
  end

  def display
    puts "\n#{'=' * 60}"
    puts 'SESSION CALCULATION & ANALYSIS HISTORY'.center(60)
    puts '=' * 60

    if @entries.empty?
      puts 'No operations recorded in this session yet.'
    else
      @entries.each_with_index do |entry, idx|
        puts sprintf('[%02d] [%s] %-15s : %s', idx + 1, entry.timestamp, entry.category, entry.details)
      end
    end
    puts '=' * 60
  end

  def clear
    @entries.clear
    puts 'History cleared.'
  end
end
