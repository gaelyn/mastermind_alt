require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'
require './lib/message'
require './lib/game'

codemaker = Codemaker.new
codebreaker = Codebreaker.new(codemaker)
turn = Turn.new(codemaker, codebreaker)
message = Message.new(codebreaker, turn)
game = Game.new(codemaker,codebreaker,turn,message)


game.start_game
