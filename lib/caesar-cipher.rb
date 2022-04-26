require 'pry-byebug'

class String
  def is_i?
    to_i.to_s == self
  end
end

class Message
  def initialize(message)
    @message = message
    @characters = message.split('')
    @lowercase = ('a'..'z').to_a
    @uppercase = ('A'..'Z').to_a
    @nums = (0..9).to_a
  end

  def letter_shifter(letter, number)
    letters = @lowercase.include?(letter) ? @lowercase : @uppercase
    index = letters.find_index(letter)
    new_index = index + number
    new_index -= 26 if new_index >= 26
    letters[new_index]
  end

  def num_shifter(shiftee, shifter)
    (shiftee.to_i + shifter).to_s
  end

  def caesar_cipher(number)
    @characters.map do |character|
      if @lowercase.include?(character.downcase)
        letter_shifter(character, number)
      elsif character.is_i?
        num_shifter(character, number)
      else
        character
      end
    end.join
  end
end
