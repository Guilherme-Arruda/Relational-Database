#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))

echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $USERNAME_RESULT ]] 
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS

NUMBER_OF_GUESSES=1

while [[ $GUESS != $SECRET_NUMBER ]] 
do 
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
  fi
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ -z $USERNAME_RESULT ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 1, $NUMBER_OF_GUESSES)")
else
  if [[ $NUMBER_OF_GUESSES -gt $BEST_GAME ]]
  then
    UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
  else
    UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
  fi
fi
