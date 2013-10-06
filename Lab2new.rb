# Part1: Hello World
class HelloWorldClass
  def initialize(name)
    @name = name.capitalize
  end
  def sayHi
    puts "Hello #{@name}!"
  end
end
hello = HelloWorldClass.new("{Ryan}")
# hello.sayHi

# Part2: Strings

def palindrome?(string)
  stringLowerCase = string.downcase
  tempStrArray = Array.new()
  tempStrArray = stringLowerCase.split(%r{\W*})
  tempStrConcat = String.new
  tempStrArray.each { |tempStr| tempStrConcat << tempStr }
  tempStrConcatReverse = tempStrConcat.reverse
  return tempStrConcat == tempStrConcatReverse
end

#puts palindrome?("A man, a plan, a canal -- Panama")
#puts palindrome?("abc")
#puts palindrome?("Madam, I'm Adam!") 
#puts palindrome?("Abracadabra")  

def count_words(string)
  tempStr = string.downcase
  wordCountHash = Hash.new(0)
  tempStrArray = Array.new
  tempStrArray = tempStr.split(%r{\b\W*\b})
  tempStrArray.each do |str|
    if wordCountHash.has_key?(str) 
      wordCountHash[str] += 1
    else 
      wordCountHash[str] = 1
    end
  end
  return wordCountHash
end

#puts count_words("A man, a plan, a canal -- Panama")
#puts count_words "Doo bee doo bee doo"

#Part 3 - Rock Paper Scissors

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  game[0][1] = game[0][1].downcase
  game[1][1] = game[1][1].downcase
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless ( game[0][1] == "r" || game[0][1] == "p" || game[0][1] == "s" ) && ( game[1][1] == "r" || game[1][1] == "p" || game[1][1] == "s" )
  if game[0][1] == game[1][1]
    return game[0]
  elsif game[0][1] == "r" && game[1][1] == "s"
    return game[0]
  elsif game[0][1] == "p" && game[1][1] == "r"
    return game[0]
  elsif game[0][1] == "s" && game[1][1] == "p"
    return game[0]
  else return game[1]
end
end

# puts rps_game_winner([ ["Armando", "p"], ["Dave", "r"] ])

#def rps_tournament_winner(tournament)
  
  
x = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ]
    ]
]

puts "size: " + x.size.to_s
puts "length: " + x.length.to_s    
puts "size of 0: " + x[0].size.to_s
puts "size of 1: " + x[1].size.to_s
puts "flatten: " + x.flatten.to_s
puts "slice flatened: " + x..to_s
