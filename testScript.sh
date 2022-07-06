#!/bin/sh

USER_HASH="9f06243abcb89c70e0c331c61d871fa7"

noDupsHash=$(echo $USER_HASH | grep -o '^\S\+')

echo "$noDupsHash"

## nick's solution with grep instead of sed
## level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')
## firstChar=${level_HASH::1}
