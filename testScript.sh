#!/bin/sh

USER_HASH="9f06243abcb89c70e0c331c61d871fa7"

noDupsHash=""

## created by stripping any duplicate characters from the string
#noDupsHash=$(echo "$USER_HASH" | sed 's/\([A-Za-z]\)\1\+/\1/g')

echo "$noDupsHash ********"
# possible loop for each character in USER_HASH
#foo=string
for char in $USER_HASH; do
  printf '%s' "$char" | cut -c 1
done
