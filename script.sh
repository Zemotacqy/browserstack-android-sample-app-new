echo "Running Bash Script to upload Apps"

APP_UPLOAD_RESPONSE=$(curl -u "$BROWSERSTACK_USERNAME:$BROWSERSTACK_USERNAME" -X POST https://$BROWSERSTACK_HOSTNAME/app-automate/upload -F "file=@Wikipedia.apk")

APP_ID=$(echo $APP_UPLOAD_RESPONSE | jq -r ".app_url")
if [ $APP_ID != null ]; then
  echo "Apk uploaded to BrowserStack with app id : ",$APP_ID;
  echo "export BROWSERSTACK_APP_ID=$APP_ID" >> $BASH_ENV;
  source $BASH_ENV;
  echo "Setting value of BROWSERSTACK_APP_ID in environment variables to  ",$APP_ID;
else
  UPLOAD_ERROR_MESSAGE=$(echo $APP_UPLOAD_RESPONSE | jq -r ".error")
  echo "App upload failed, reason : ",$UPLOAD_ERROR_MESSAGE
  exit 1;
fi
