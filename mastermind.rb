require './lib/codemaker'
require './lib/codebreaker'
require './lib/turn'
require './lib/message'
require './lib/game'

codemaker = Codemaker.new
codebreaker = Codebreaker.new(codemaker)
turn = Turn.new(codemaker, codebreaker)
message = Message.new(codebreaker, turn)
game = Game.new(codemaker,codebreaker,turn, message)

message.welcome_message
message.user_input_prompt
@user_input = gets.chomp

if @user_input == "p"
  game.start_game
  game.cheat
  game.turn_loop
elsif @user_input == "i"
  message.instructions
elsif @user_input == "q"
  message.quit
end
