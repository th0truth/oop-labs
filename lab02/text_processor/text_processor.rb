# frozen_string_literal: true

class TextProcessor
  VOWELS_REGEX = /[аеєиіїоуюяaeiouy]/i
  CONSONANTS_REGEX = /[бвгґджзйклмнпрстфхцчшщbcdfghjklmnpqrstvwxz]/i

  attr_accessor :input_text

  def initialize(input_text = '')
    @input_text = input_text
  end

  def calculate_length
    @input_text.length
  end

  def convert_to_upper_case
    @input_text.upcase
  end

  def count_words
    @input_text.split(/\s+/).reject(&:empty?).size
  end

  def count_sentences
    sentences = @input_text.split(/[.!?]+/).reject { |s| s.strip.empty? }
    return 1 if sentences.empty? && count_words.positive?

    sentences.size
  end

  def reverse_text
    @input_text.reverse
  end

  def count_vowels
    @input_text.scan(VOWELS_REGEX).size
  end

  def count_consonants
    @input_text.scan(CONSONANTS_REGEX).size
  end
end