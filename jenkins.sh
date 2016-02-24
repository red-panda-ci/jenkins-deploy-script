#!/bin/bash
#
# (Place the script on after integration trigger)
#
# Author: Pablo Serrano
#
# You need add jenkins module "managed scripts" and set this Argument list:
# - appid
# - name
# - notes
# - tags 
#
## Applivery Configuration
API_TOKEN="Put your applivery token"
APP_ID="$1"
NAME="$2"
NOTES="$3"
TAGS="$4"
# BOT_NAME. Should be the bot name. By default is "{PRODUCT_NAME} bot".
APP_NAME="app-debug"
# DO NOT EDIT BELOW HERE!
########################################
# Last Integration Path
INTEGRATION_PATH="app/build/outputs/apk"
APK="${INTEGRATION_PATH}/${APP_NAME}.apk"
echo "APK Path: ${APK}"
echo "*** Uploading to Applivery ***"
curl "https://dashboard.applivery.com/api/builds" -H "Authorization:${API_TOKEN}" -F app="${APP_ID}" -F versionName="${NAME}" -F notes="${NOTES}" -F os="android" -F tags="${TAGS}" -F package=@"${APK}"
echo "Applivery upload finished!"
