#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate to have fresh insert
echo $($PSQL "TRUNCATE teams, games")

# Insert teams
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  # winner teams
  if [[ $WINNER != winner ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team (winner)
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted winner into teams, $WINNER
      fi
    fi
  fi
  # opponent teams
  if [[ $OPPONENT != opponent ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      #insert team (opponent)
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted opponent into teams, $OPPONENT
      fi
    fi
  fi

# insert games function
# get winner_id fk
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

# get opponent_id fk
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

#insert game
INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WGOALS', '$OGOALS')")
if [[ $INSERT_GAMES_RESULT == 'INSERT 0 1' ]]
then
  echo Inserted game $WINNER vs. $OPPONENT in $ROUND
fi

done
