## Desired interaction  


```
Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?
> i
#print brief description of instructions

> q
#exit out of game

> p

#RGBY
I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?
> rrrr

'RRRR' has 1 of the correct elements with 1 in the correct positions
You've taken 1 guess

>rbgy
'RBGY' has 4 of the correct elements with 2 in the correct positions
You've taken 2 guess

>rybg
'RYBG' has 4 of the correct elements with 1 in the correct positions
You've taken 3 guess

>rrg
'your guess is too short'

>rrggyy
'your guess is too long'

>rgby
#enter end game flow
'Congratulations! You guessed the sequence 'RGBY' in 8 guesses over 4 minutes,
22 seconds.'
Do you want to (p)lay again or (q)uit?

>p
#loop the game
```

```ruby
guess = "rrrr"
answer = "RGBY"

def num_correct_elements

end  

def num_correct_positions

end

def correct_guess?
  guess == answer
end
```
