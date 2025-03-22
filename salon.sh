#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "$1"
  fi
  # List services
  echo -e "\nWelcome to My Salon, how can I help you?"
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  echo "6) exit"
  
  # Select MAIN_MENU SERVICE
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) PERM ;;
    4) STYLE ;;
    5) TRIM ;;
    6) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac

}

CUT(){
  # service_id
  SERVICE_ID_SELECTED=1

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check if customer name exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # if not 
  if [[ -z $CUSTOMER_NAME ]]
  then
  
    # Take customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create the customer
    CUSTOMER_CREATE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  fi
  
  # Take time
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME  
  
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")  

  # create appointment
  CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

}

COLOR(){
  # service_id
  SERVICE_ID_SELECTED=2

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check if customer name exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # if not 
  if [[ -z $CUSTOMER_NAME ]]
  then
  
    # Take customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create the customer
    CUSTOMER_CREATE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  fi
  
  # Take time
  echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
  read SERVICE_TIME  
  
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")  

  # create appointment
  CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."

}

PERM(){
  # service_id
  SERVICE_ID_SELECTED=3

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check if customer name exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # if not 
  if [[ -z $CUSTOMER_NAME ]]
  then
  
    # Take customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create the customer
    CUSTOMER_CREATE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  fi
  
  # Take time
  echo -e "\nWhat time would you like your perm,$CUSTOMER_NAME?"
  read SERVICE_TIME  
  
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")  

  # create appointment
  CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a perm at $SERVICE_TIME,$CUSTOMER_NAME."

}

STYLE(){
   # service_id
  SERVICE_ID_SELECTED=4

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check if customer name exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # if not 
  if [[ -z $CUSTOMER_NAME ]]
  then
  
    # Take customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create the customer
    CUSTOMER_CREATE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  fi
  
  # Take time
  echo -e "\nWhat time would you like your style,$CUSTOMER_NAME?"
  read SERVICE_TIME  
  
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")  

  # create appointment
  CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a style at $SERVICE_TIME,$CUSTOMER_NAME."
}

TRIM(){
   # service_id
  SERVICE_ID_SELECTED=5

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check if customer name exists
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # if not 
  if [[ -z $CUSTOMER_NAME ]]
  then
  
    # Take customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create the customer
    CUSTOMER_CREATE=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  fi
  
  # Take time
  echo -e "\nWhat time would you like your trim,$CUSTOMER_NAME?"
  read SERVICE_TIME  
  
  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")  

  # create appointment
  CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a trim at $SERVICE_TIME,$CUSTOMER_NAME."
}

EXIT(){
  echo -e "\nThank you for your visit."
}

MAIN_MENU