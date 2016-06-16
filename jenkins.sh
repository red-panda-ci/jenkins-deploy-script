#!/bin/bash
# Author: Pablo Serrano
# Place the script after integration trigger)
# You need to add Jenkins Managed Scripts Plugin and set this Argument list:
# - appid
# - name
# - notes
# - tags 
#
# --- Applivery Configuration ---
API_TOKEN="Put your applivery token"
APP_NAME="app-debug"
# -------------------------------
# --- DO NOT EDIT BELOW HERE! ---
# -------------------------------
APP_ID="$1"
NAME="$2"
NOTES="$3"
TAGS="$4"
# Last Integration Path
INTEGRATION_PATH="app/build/outputs/apk"
APK="${INTEGRATION_PATH}/${APP_NAME}.apk"
echo "# APK Path: ${APK}"
echo "# Uploading to Applivery..."
curl "https://dashboard.applivery.com/api/builds" -H "Authorization:${API_TOKEN}" -F app="${APP_ID}" -F versionName="${NAME}" -F notes="${NOTES}" -F os="android" -F tags="${TAGS}" -F package=@"${APK}"
echo "# Applivery upload success!"
