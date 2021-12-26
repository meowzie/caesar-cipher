def caesar_cipher(string, number)
  characters = string.split("")
  capital_letters = ("A".."Z").to_a*2
  small_letters = ("a".."z").to_a*2
  shifted = characters.map do |character|
    if small_letters.any?(character)
      index = small_letters.find_index(character)
      character = small_letters[index+number]
    elsif capital_letters.any?(character)
      index = capital_letters.find_index(character)
      character = capital_letters[index+number]
    else
      character
    end
  end
  shifted.join
end
puts "Enter a string"
string = gets.chomp
puts "\nEnter a number"
number = gets.chomp.to_i
puts "\n" + caesar_cipher(string, number)