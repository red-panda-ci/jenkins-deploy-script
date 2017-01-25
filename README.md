# Applivery upload shell script

Usage:

$ wget -O - https://raw.githubusercontent.com/pedroamador/jenkins-deploy-script/master/jenkins.sh | bash -s -- \
    --apikey="your_private_apikey" \
    --app="your_applicationname" \
    --os="apk_or_ios" \
    --package="/path/to/the/appilcation builded.apk" \
    --versionName="version_name" \
    --notes="notes_of_this_build" \
    --notify="true_or_false" \
    --tags="tags_of_this_build"

