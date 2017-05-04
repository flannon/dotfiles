#!/bin/bash

set -e

[[ -z $1 ]] && PROFILE="default" || PROFILE=$1

CREDS="${HOME}/.aws/credentials"

if [[ -f $CREDS ]]; then

  # Read the file into an array
  while IFS= read -r line; do
    CREDARRAY+=("$line")
  done < "$CREDS"

  # Check that the profile name exists
  for e in "${CREDARRAY[@]}"; do
    if [[ $e == "[${PROFILE}]" ]]; then
      validate=$e
    fi
  done

  if [[ -z $validate ]]; then
    echo "aws profile \"$PROFILE\" doesn't exit"
    exit 1
  fi

  # Get the access key and secrete key
  for e in "${CREDARRAY[@]}"; do
    if [[ $e == "[${PROFILE}]" ]]; then
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

# choping the first char is a kludge, but works for now.
export AWS_PROFILE=${PROFILE}
export AWS_ACCESS_KEY_ID=${ACCESSKEY:1}
export AWS_SECRET_ACCESS_KEY=${SECRETKEY:1}

