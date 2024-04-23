#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
  #query the element
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "
      SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
      FROM elements 
      LEFT JOIN properties USING (atomic_number)
      LEFT JOIN types USING (type_id)
      WHERE elements.symbol='$1'
      OR elements.name='$1';
    ")
  else
    ELEMENT=$($PSQL "
      SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
      FROM elements 
      LEFT JOIN properties USING (atomic_number)
      LEFT JOIN types USING (type_id) 
      WHERE elements.atomic_number=$1;
    ")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # output the element info
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
else
  echo Please provide an element as an argument.
fi
