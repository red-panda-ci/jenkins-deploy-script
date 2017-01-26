#!/bin/bash
echo "Applivery Uploader (c)"
echo

# Parse variables
echo -n "Parsing arguments..."
apikey=""
app=""
versionName=""
notes=""
notify=""
tags=""
package=""
while [ $# -gt 0 ]; do
  case "$1" in
    --apikey=*)
      apikey="${1#*=}"
      ;;
    --os=*)
      os="${1#*=}"
      ;;
    --package=*)
      package="${1#*=}"
      ;;
    --app=*)
      app="${1#*=}"
      ;;
    --versionName=*)
      versionName="${1#*=}"
      ;;
    --notes=*)
      notes="${1#*=}"
      ;;
    --notify=*)
      notify="${1#*=}"
      ;;
    --tags=*)
      tags="${1#*=}"
      ;;
    *)
      printf " [ERROR] Invalid argument '$1 '\n"
      exit 1
  esac
  shift
done

# Check mandatory parameters
if [[ -z "$apikey" ]]
then
  echo " [ERROR] No 'apikey' value"
  exit 1
fi
if [[ -z "$app" ]]
then
  echo " [ERROR] No 'app' argument"
  exit 1
fi
if [[ -z "$os" ]]
then
  echo " [ERROR] No 'os' argument"
  exit 1
fi
if [[ -z "$package" ]]
then
  echo " [ERROR] No 'package' argument"
  exit 1
fi

echo "...all arguments seems to be OK"
echo
echo "apikey......: **********"
echo "app.........: $app"
echo "os..........: $os"
echo "package.....: $package"
[ "$versionName" ] && echo "versionName.: $versionName"
[ "$notes" ]       && echo "notes.......: $notes"
[ "$notify" ]      && echo "notify......: $notify"
[ "$tags" ]        && echo "tags........: $tags"


# Upload
http_code=`curl -s -o /dev/null -w "%{http_code}" "https://dashboard.applivery.com/api/builds" \
    -H "Authorization:${apikey}" \
    -F app="${app}" \
    -F versionName="${versionName}" \
    -F notes="${notes}" \
    -F os="${os}" \
    -F tags="${tags}" \
    -F package=@"${package}" `

if [ $http_code -eq 200 ]
then
    echo "# Applivery upload success!"
    exit 0
else
    echo "ERROR: Applivery upload failed ($http_code)"
    exit 1
fi
