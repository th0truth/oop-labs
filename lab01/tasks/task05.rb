# frozen_string_literal: true

require_relative '../task'
require_relative '../input_helper'

class Task05 < Task
  VOWELS_REGEX = /[аеєиіїоуюяaeiouy]/i
  CONSONANTS_REGEX = /[бвгґджзйклмнпрстфхцчшщbcdfghjklmnpqrstvwxz]/i

  def title
    'Analyze Text (Characters, Words, Sentences, Letters)'
  end

  def execute
    puts 'Text Analysis Application'
    puts 'Enter the text you would like to analyze (Ukrainian and English supported):'

    text = InputHelper.read_line('> ', allow_empty: true)

    if text.strip.empty?
      puts 'Error: Text cannot be empty!'
      return
    end

    metrics = analyze(text)
    display_table(metrics)
  end

  private

  def analyze(text)
    char_count = text.length
    words_count = text.split(/\s+/).reject(&:empty?).size
    sentences_count = text.split(/[.!?]+/).reject { |s| s.strip.empty? }.size

    # In case there are no terminal punctuation marks, but text is present, count as 1 sentence
    sentences_count = [sentences_count, 1].max if words_count.positive?

    vowels_count = text.scan(VOWELS_REGEX).size
    consonants_count = text.scan(CONSONANTS_REGEX).size

    {
      characters: char_count,
      words: words_count,
      sentences: sentences_count,
      vowels: vowels_count,
      consonants: consonants_count
    }
  end

  def display_table(metrics)
    puts "\n+--------------------------------+--------+"
    puts '| Metric                         | Value  |'
    puts '+--------------------------------+--------+'
    puts sprintf('| %-30s | %6d |', 'Total characters', metrics[:characters])
    puts sprintf('| %-30s | %6d |', 'Words', metrics[:words])
    puts sprintf('| %-30s | %6d |', 'Sentences', metrics[:sentences])
    puts sprintf('| %-30s | %6d |', 'Vowel letters', metrics[:vowels])
    puts sprintf('| %-30s | %6d |', 'Consonant letters', metrics[:consonants])
    puts '+--------------------------------+--------+'
  end
end
