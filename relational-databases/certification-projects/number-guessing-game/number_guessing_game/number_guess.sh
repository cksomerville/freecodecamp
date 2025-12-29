#!/bin/bash

# PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Number Guessing Game
echo -e "\n~~~ Number Guessing Game ~~~\n"

# Enter Username
echo "Enter your username:"
read USERNAME

# Look up if user exists
USER_RESULT=$($PSQL "SELECT u.user_id, u.username, COUNT(g.game_id), MIN(g.guesses) FROM users u LEFT JOIN games g ON u.user_id = g.user_id WHERE u.username='$USERNAME' GROUP BY u.user_id, u.username")

if [[ -z $USER_RESULT ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Get USER_ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  echo "$USER_RESULT" | while IFS="|" read USER_ID USERNAME PLAYED BEST
  do
    echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
  done
  # Get USER_ID
  USER_ID=$(echo "$USER_RESULT" | cut -d'|' -f1)
fi

# Number generator
SECRET_NUMBER=$((1 + RANDOM % 1000))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while true
do
  # Validate integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
  fi

  # Number of guesses
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  # Guess is higher/lower/win
  # Lower
  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
  # Higher
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
  # Win
  else
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES('$USER_ID', '$NUMBER_OF_GUESSES')")
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done
