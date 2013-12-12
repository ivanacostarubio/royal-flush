# Venezuelan Truco in Ruby. #

This is a small game engine that allows you to play Truco Venezuelan style.

Take a look at lib/loader for an example on how to initiate the game. Moreover, we have a good test suite that will give you an idea of how to put everything together.

### TODO: ###

# ##### this is on truco-ruby.
# being able to bet on each hand
# have a gameloop that goes up to 12 points.
######

- Being able to call @game.winner_for_first_hand without playing the first hand. Also for second and third hand. 

- Logic for envido, truco, etc. AKA apostar between moves. See /lib/truco.rb and spec/truco.rb

- validations: When asking a user for input, we must validate he chooses a correct card.
