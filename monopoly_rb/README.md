# MonopolyRb
This is the implementation of the monopoly kata in ruby. You can find the instruction here [http://schuchert.wikispaces.com/Monopoly%28r%29](http://schuchert.wikispaces.com/Monopoly%28r%29).

By now I implemented only the first 2 release.

# User stories

##Release 1: Basic Board and Player Movement
For this first release, we want to be able to support the basic player movement. All players start on the first location. The players' order is initially determined randomly and then maintained for the remainder of the game. Each player takes a turn, during which they roll a pair of dice, move from their current location to a destination calculated based on their current location plus the roll of the dice. The board has a total of 40 locations. When the player reaches the end of the board, s/he starts back at the beginning again. Since this version is so simple, we'll simply play a total of 20 rounds, where a round means every player takes a turn.

###Player Movement
####As a player, I can take a turn so that I can move around the board.

_User Acceptance Tests_

- Player on beginning location (numbered 0), rolls 7, ends up on location 7
- Player on location numbered 39, rolls 6, ends up on location 5

####As a game, I can have between 2 and 8 players with an initial random ordering.

_User Acceptance Tests_

- Create a game with two players named Horse and Car.
- Try to create a game with < 2 or > 8 players. When attempting to play the game, it will fail.
- Create a game with two players named Horse and Car. Within creating 100 games, both orders [Horse, Car] and [car, horse] occur.

####As a game, I execute 20 rounds so that I can complete a game.

_User Acceptance Tests_

- Create a game and play, verify that the total rounds was 20 and that each player played 20 rounds.
- Create a game and play, verify that in every round the order of the players remained the same.

##Release 2: Go, Go To Jail, Income Tax, Luxury Tax
When a player lands on go, they receive $200. When a player passes go, they receive $200. Note they get the money at the time they land on or pass over go, not the next turn. The do not get any money for leaving go (e.g. during the first turn or if they landed on go the previous turn).

When a player lands on go to jail, they are moved directly to "Just Visiting". They do not receive any money for passing go since they went directly to just visiting. Note that we are making this simple for now, we deal with the details of jail later.

When a player lands on Income Tax, they must pay 20% of their net worth or $200, whichever is the smaller amount (a simplified version of the rule).

When a player lands on luxury tax, they must pay $75.

####As a player, when I land on go I get $200 as my salary for staying in the game.

_User Acceptance Tests_

- During a turn a Player lands on Go and their balance increases by $200.
- During a turn a Player lands on some "normal" location and their balance does not change.


####As a player, I receive $200 when I pass over Go.

_User Acceptance Tests_

- Player starts before Go near the end of the Board, rolls enough to pass Go. The - - Player's balance increases by $200.
- Player starts on Go, takes a turn where the Player does not additionally land on or pass over Go. Their balance remains unchanged.
- Player passes go twice during a turn. Their balance increases by $200 each time for a total change of $400.

####As a Player, when I land on Go To Jail during a turn I move directly to Just Visiting.

_User Acceptance Tests_

- Player starts before Go To Jail, lands on Go To Jail, ends up on Just Visiting and their balance is unchanged.
- Player starts before Go To Jail, rolls enough to pass over Go To Jail but not enough to land on or pass over go. Their balance is unchanged and they end up where the should based on what they rolled.


####As a Player, landing on Income Tax forces me to pay the smaller of 10% of my total worth or $200.

_User Acceptance Tests_

- During a turn, a Player with an initial total worth of $1800 lands on Income Tax. The balance decreases by $180.
- During a turn, a Player with an initial total worth of $2200 lands on Income Tax. The balance decreases by $200.
- During a turn, a Player with an initial total worth of $0 lands on Income Tax. The balance decreases by $0.
- During a turn, a Player with an initial total worth of $2000 lands on Income Tax. The balance decreases by $200.
- During a turn, a Player passes over Income Tax. Nothing happens.

####As a Player, when I land on Luxury Tax, I pay $75.

_User Acceptance Tests_

- Player takes a turn and lands on Luxury tax. Their balance decreases by $75.
- Player passes Luxury Tax during a turn. Their balance is unchanged.


##Release 3: Real Estate
Players can purchase railroads, utilities and Properties. When a player lands on unowned real estate, they immediately purchase it and the price is deducted from their balance (you can allow the player's balance to go below 0 or you can cancel the purchase if they cannot afford it).

When a player lands on an owned real estate, they must pay rent equal to the rent amount to the owner (assuming they are not the owner). 

When a player lands on a mortgaged property, nothing happens.

A player has the option of mortgaging a property or paying off the mortgage of a property at the beginning of their turn or at the end of their turn.

Properties: If a player owns all of the properties in a color group, the rent doubles. 

Utilities: If only one utility is owned, then rent is equal to 4 times the value currently shown on the dice. If both utilities are owned (not necessarily by the same person), then rent is equal to 10 times the value currently shown on the dice.

Railroads: If a player owns one railroad, rent is $25. If a player owns two, rent is $50, 3 is $100 and 4 is $200.

####As a player, I can buy an unowned property when I land on it during a turn.

_User Acceptance Tests_

- Land on a Property that is not owned. After turn, property is owned and balance decreases by cost of property.
- Land on a Property that I own, nothing happens.
- Pass over an unowned Property, nothing happens.

####As a player, I pay rent when I land on a Property that is owned by someone else.

_User Acceptance Tests_

- Land on a Property owned by other player, player pays rent to owner. Player's balance decreases by rent amount. Owners balance increases by rent amount.
- If landing on Railroad, rent is 25, 50, 100, 200 depending on how many are owned by owner (1 - 4).
- If landing on Utility and only one Utility owned, rent is 4 times current value on Dice.
- If landing on Utility and both owned (not necessarily by same Player), rent is 10 times current value on Dice.
- If landing on Real Estate and not all in the same Property Group are owned, rent is stated rent value.
- If landing on Real Estate and Owner owns all in the same Property Group, rent is 2 times stated rent value.

##Release 4: Jail
A player can land in jail when:

- S/he lands on "go To Jail" 
-  S/he draws a "Go To Jail" card
- Throws doubles three times in a row

When a player goes to jail, s/he does not collect $200 for passing go since s/he moves directly to jail.

A player can get out of jail in any of the following ways:
By throwing Doubles on any of the next three turns after landing in Jail. If the player rolls doubles but does not pay (or use a get out of jail free card), then the player moves forward the number of locations indicated by the dice but does not continue rolling the dice.
By using a "Get out of Jail Free" card from another player. (A player can purchase a "Get out of Jail Free" card from another player.
By paying a $50 fine before throwing the dice, in which case the player is no "Just Visiting"

If a player is still in jail after rolling dice (and not paying a fine) on the third turn, they must pay $50 and moves ahead the number of locations shown on the dice.

####As a Player, when I land on Go To Jail, I go directly to Jail and do not pass Go.

_User Acceptance Tests_

- Roll non-doubles, land on Go To Jail, player is in Jail, turn is over, balance is unchanged.
- Roll doubles, land on Go To Jail, player is in Jail, turn is over, balance is unchanged.
- Pass over Go To Jail, nothing happens.

####As a player, when I roll doubles three times in a row during the same turn, I Go To Jail.

_User Acceptance Tests_

- Roll doubles 3 times in a row, never pass or land on go. Balance is unchanged. Player is in Jail.
- Roll doubles 3 times in a row, pass or land on go during first two rolls. Balance increases by $200. Player is in Jail.
- Roll doubles 2 times in a row. Player is not in Jail.


####As a plyaer, when I'm in Jail at the beginning of my turn I can pay $50 to take a normal turn.

_User Acceptance Tests_

- In Jail, Player pays $50. Rolls doubles, moves and rolls again, balance decreased by $50.
- In Jail, Player pays $50. Rolls doubles, moves, does not roll a second time, balance decreased by $50.


####As a Player in Jail, I can try to roll doubles and get out of Jail for free.

_User Acceptance Tests_

- In Jail turns 1/2, roll doubles. Move once, no more rolling/moving.
- In Jail, turn 1/2, do not roll doubles. Still in Jail.
- In Jail, turn 3, roll doubles. Move and don't roll again.
- In Jail, turn 3, do not roll doubles. Move, balance decreased by $50.

##Release 5: Community Chest and Chance
Community chest and chance each have a single stack of cards. There is one stack of cards shared by all community chest locations and one stack of cards shared by all chance locations. The order of the cards is initially determined randomly. Once determined, the order remains the same (this iteration skips the get out of jail free card).

When a player lands on either of these locations, the next card (from the top of the deck) is removed, the player must follow the instructions on the card. The card is the placed back onto the deck at the bottom.

####As a Player, when I land on Community Chest or Chance I must play a card.

_User Acceptance Tests_

- Player passes over Community Chest, nothing happens.
- Player lands on Community Chest not rolling doubles. Player plays card. Card's effect happens. Card at bottom of stack of cards.
- Player lands on Community Chest rolling doubles. Player plays card. Cards' effect happens. Card at bottom of stack of cards:
	- Player continues rolling if it was roll 1/2 and they did not get the Go To Jail card.
	- Player does not continue rolling if it was roll 1/2 and they did get the Go To Jail card.

