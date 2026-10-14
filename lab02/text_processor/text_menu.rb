# frozen_string_literal: true

require_relative 'text_processor'

class TextMenu
  def self.run(history = nil)
    puts "\n#{'=' * 50}"
    puts 'PROGRAM 1: TEXT PROCESSOR'.center(50)
    puts '=' * 50

    print 'Enter text to process: '
    input = $stdin.gets&.strip

    if input.nil? || input.empty?
      puts 'Error: Text cannot be empty!'
      return
    end

    processor = TextProcessor.new(input)

    length = processor.calculate_length
    uppercase = processor.convert_to_upper_case
    words = processor.count_words
    sentences = processor.count_sentences
    reversed = processor.reverse_text
    vowels = processor.count_vowels
    consonants = processor.count_consonants

    puts "\n#{'-' * 50}"
    puts 'Results of Text Analysis:'
    puts '-' * 50
    puts "Original Text:       #{processor.input_text}"
    puts "Uppercase:           #{uppercase}"
    puts "Reversed:            #{reversed}"
    puts "Length (characters): #{length}"
    puts "Words:               #{words}"
    puts "Sentences:           #{sentences}"
    puts "Vowels:              #{vowels}"
    puts "Consonants:          #{consonants}"
    puts '-' * 50

    # Save to session history (High Level requirement)
    history&.add('Text Analysis', "Text: \"#{input}\" -> Length: #{length}, Words: #{words}, Sentences: #{sentences}")
  end
end
