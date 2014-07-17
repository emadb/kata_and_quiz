##Tennis Game Kata##

Original posting: [http://agilekatas.co.uk/katas/tennis-kata.html](http://agilekatas.co.uk/katas/tennis-kata.html)

###Iteration 1

For the first iteration we would like to develop the actual scoring algorithm that will be used for all of our future tennis endeavours. For now, we want to be able to update the score when a player wins a point, and see what the current score is after each point is won based on the rules above. 

####Winning Points Increases Score

As a Tennis game designer
I want the score to increase when a player wins a point
So that I can display the current score correctly 

- When player one wins one point, the score is 'fifteen-love'.
- When player one wins one point and player two wins one point, the score is 'fifteen-all'.
- When player one wins two points and player two wins three points, the score is 'thirty-forty'.
- When player one wins no points and player two wins three points, the score is 'love-forty'.

####Deuce and Advantage are Scored Correctly

As a Tennis game designer
I want 'deuce' and 'advantage' to be handled automatically
So that I can correctly account for ties 

- When player one wins three points and player two wins three points, the score is 'deuce'.
- When player one wins five points and player two wins five points, the score is 'deuce'.
- When player one wins four points and player two wins three points, the score is 'advantage player one'.
- When player one wins four points and player two wins five points, the score is 'advantage player two'.

####Player Can Win a Match

As a Tennis game designer
I want a player to be able to win
So that I can show the winner at the end 

- When player one wins four points, the score is 'player one wins'
- When player one wins five points and player two wins three points, the score is 'player one wins'.
- When player one wins six points and player two wins eight points, the score is 'player two wins'.

