#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_TO_GUESS=$(( ( RANDOM % 1000 )  + 1 ))
echo $NUMBER_TO_GUESS

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  #create new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')");
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  USER_GAMES=$($PSQL "
    SELECT COUNT(*) AS games_played, MIN(score) AS best_game
    FROM games
    WHERE user_id=$USER_ID
  ")

  echo $USER_GAMES | while IFS="|" read GAMES_PLAYED BEST_SCORE
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
  done
fi

ATTEMPTS=1
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS
done

while [ $GUESS != $NUMBER_TO_GUESS ]
do
  if [[ $GUESS > $NUMBER_TO_GUESS ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  ATTEMPTS=$(($ATTEMPTS+1))
  read GUESS
done

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, score) VALUES ($USER_ID, $ATTEMPTS)")

echo "You guessed it in $ATTEMPTS tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

