################
# Ryan Riley   #
# csci 3308    #
# Assignment 2 #       
################


#####################################################################
# NOTE: I had help from stackoverflow for defined? and class_eval   #           
#                 ALSO: I have commented all of the test cases      #  
#################################################s###################


###########################
#  Part0: Lab2 remainder  #
###########################


     #################################
     # Part0.3 - Rock Paper Scissors #
     #################################

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  firstPlayerMove = game[0][1].downcase
  secondPlayerMove = game[1][1].downcase
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless ( firstPlayerMove == "r" || firstPlayerMove == "p" || firstPlayerMove == "s" ) && ( secondPlayerMove == "r" || secondPlayerMove == "p" || secondPlayerMove == "s" )
  if firstPlayerMove == secondPlayerMove
    return game[0]
  elsif firstPlayerMove == "r" && secondPlayerMove == "s"
    return game[0]
  elsif firstPlayerMove == "p" && secondPlayerMove == "r"
    return game[0]
  elsif firstPlayerMove == "s" && secondPlayerMove == "p"
    return game[0]
  else return game[1]
end
end

# puts rps_game_winner([ ["Armando", "p"], ["Dave", "r"] ])

def rps_tournament_winner(tournament)
   if !tournament.first.to_s.match('\w*').to_s.empty?
     return tournament
   else 
     game = [rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])]
     unless game.nil?
        return rps_game_winner(game)
     end
   end
end





     ######################## 
     #  Part 0.4: Anagrams  #
     ########################

def combine_anagrams(words)
  wordArr = Array.new(words)
  anagArr = Array.new
  wordArr.each do |word|
    anagArr << wordArr.select { |wordIter| wordIter.chars.sort.join == word.chars.sort.join }
    wordArr = wordArr - anagArr.last
  end
  return anagArr.delete_if { |elem| elem.empty? }
end

#p combine_anagrams(["cars", "for", "potatoes", "racs", "four", "scar", "creams", "scream"])

#################### 
# Part 1: Classes  #
####################

class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    if @calories < 200
      return true
    else return false
    end
  end

  def delicious?
    return true
  end
end

#cake = Dessert.new(cake, 400)
#puts cake.healthy?
#puts cake.delicious?

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  def delicious?
    if @flavor == "black licorice"
      return false
    else return true
    end
  end
end

jelly = JellyBean.new(jelly, 300, "watermelon")
puts "delicious: " + jelly.delicious?.to_s
puts "healthy: " + jelly.healthy?.to_s
    
####################    
# Part 2: OOP      #
####################

class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s       # make sure it's a string
        attr_reader attr_name            # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter
        class_eval %Q{
	
		def #{attr_name}=(input)
			@#{attr_name} = input
			if not defined? @#{attr_name}_history
				@#{attr_name}_history = [nil, input]
			else @#{attr_name}_history << input
			end
		end 

		     }

    end			
end

class Foo
    attr_accessor_with_history :bar
end

=begin
f = Foo.new
puts "bar_history: " + f.bar_history.to_s
f.bar = 1
puts f.bar.to_s
f.bar = 2
puts "f: " + f.to_s
f.bar_history # => if your code works, should be [nil, 1, 2]
puts f.bar_history
f = Foo.new
puts f.bar_history
f.bar = 9
puts f.bar_history
puts f.bar
f.bar = 44
puts f.bar
puts f.bar_history
=end

###################
#Part 3: More OOP #
###################

class Numeric 
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  
  def convert(currency, op) 
    singular_currency = currency.to_s.gsub( /s$/, '')
     if @@currencies.has_key?(singular_currency)
          return self.send(op, @@currencies[singular_currency]) 
     else
        super
     end  
  end

  def method_missing(method_id)
    self.convert( method_id, :* )
  end

  def in(currency)
    currency = currency.to_s
    self.convert( currency, :/ )
    end
end
 
#p 1.euros.in(:dollar)
 
        ##########################
        #  Part 3.b: Palindromes #
        ##########################
class String
  def palindrome?
    self.to_s.downcase.split(%r{\W*}).join.reverse == self.to_s.downcase.split(%r{\W*}).join
  end
end

         #################################
         #  Part 3.c: Palindromes Again  #
         #################################

module Enumerable
  def palindrome?
    if self.class == Hash
      return false
    end
    self.each_with_index { |elem, i| 
      return false unless elem == self.reverse[i]
    }
    true
  end
end

=begin
puts "PALINDROME? :   " +  "A man, a plan, a canal -- Panama".palindrome?.to_s
puts "ENUM PALINDROME? WITH HASH: " + {:a => 12, :b => 13}.palindrome?.to_s
puts "ENUM PALINDROME? WITH ARRAY SHOULD BE TRUE: " + [1,2,3,2,1].palindrome?.to_s
=end

####################
#  Part 4: Blocks  #
####################


class CartesianProduct
  include Enumerable
  def initialize(seq0, seq1)
    @seq0 = seq0
    @seq1 = seq1
    def each
      i = 0  
      until i == @seq0.size
        j = 0 
        until j == @seq1.size
          yield [@seq0[i], @seq1[j]] 
          j += 1
        end
        i += 1
      end
     end
  end
end

=begin
c = CartesianProduct.new([:a, :b], [4, 5])
p c  
t = Array.new
c.each { |elt| t << elt } 
p t
c.each { |elt| puts elt.inspect } 

c = CartesianProduct.new([:a, :b], [])
c.each { |elt| puts elt.inspect } 
=end


	
