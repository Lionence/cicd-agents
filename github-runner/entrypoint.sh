echo "Configuring instance..."
/app/config.sh --url $URL --token $TOKEN --unattended
echo "Initialization done!"

echo "Starting github runner..."
/app/run.sh