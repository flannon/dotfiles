#!/bin/bash

set -e

[[ -z $1 ]] && PROFILE="default" || PROFILE=$1

CREDS="${HOME}/.aws/credentials"

if [[ -f $CREDS ]]; then

  while IFS= read -r line; do
    CREDARRAY+=("$line")
  done < "$CREDS"

  for e in "${CREDARRAY[@]}"; do
    if [[ $e == "[${PROFILE}]" ]]; then
      test=$e
      echo "test: $test"
    fi
  done

  if [[ -z $test ]]; then
    echo "aws profile \"$PROFILE\" doesn't exit"
    exit 1
  fi

  for e in "${CREDARRAY[@]}"; do
    if [[ $e == "[${PROFILE}]" ]]; then
      echo "PROFILE: $PROFILE"
      #CURRENTPOSITION=${#CREDARRAY[@]} 
      if [[ $(echo ${CREDARRAY[1]} | cut -d "=" -f1) =~ aws_access_key_id ]]; then

        ACCESSKEY=$(echo ${CREDARRAY[1]} | cut -d "=" -f2)

      fi
    
      if [[ $(echo ${CREDARRAY[2]} | cut -d "=" -f1) =~ aws_secret_access_key ]]; then
        
        SECRETKEY=$(echo ${CREDARRAY[2]} | cut -d "=" -f2)

      fi
    fi
  done
  

fi

echo "AWSPROFILE: $PROFILE"
echo "ACCESSKEY : $ACCESSKEY"
echo "SECRETKEY : $SECRETKEY"

export AWS_PROFILE=$PROFILE
export AWS_ACCESS_KEY_ID=$ACCESSKEY
export AWS_SECRET_ACCESS_KEY=$SECRETKEY

