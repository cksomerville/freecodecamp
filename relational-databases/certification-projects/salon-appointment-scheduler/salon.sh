#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ Salon ~~~\n"

MAIN_MENU() {
  echo How can we help you today?
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED
}

GET_APPOINTMENT() {
  echo -e "\n What's your phone number?"
  read CUSTOMER_PHONE
  # Are they a customer already?
  CUSTOMER_PHONE_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    # get customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # Insert name and phone into customers
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
    then
      echo "Thanks $CUSTOMER_NAME, we've put you into our system with $CUSTOMER_PHONE"
    fi

    # get time of appointment for $service
    echo -e "\nWhat time would you like to schedule your $SERVICE_NAME?"
    read SERVICE_TIME
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
    then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  # Customer already in the system
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONE_NUMBER'")
    echo -e "\nThanks for joining us again, $CUSTOMER_NAME. What time would you like your$SERVICE_NAME?"
    read SERVICE_TIME

    # Insert appointment
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME"
  fi

}

MAIN_MENU

case $SERVICE_ID_SELECTED in
  1) GET_APPOINTMENT ;;
  2) GET_APPOINTMENT ;;
  3) GET_APPOINTMENT ;;
  4) GET_APPOINTMENT ;;
  5) GET_APPOINTMENT ;;
  *) MAIN_MENU "I could not find that service. What would you like today?" ;;
esac