clear
source ./env
echo "TEST_REPO: $TEST_REPO"
echo "TEST_NAME: $TEST_NAME"
echo "DOCKER IMG:  $IMG_MOLOTOV"
echo "TEST_PROCESSES: $TEST_PROCESSES"
sleep 5

echo '-----------------------------------'
date
echo '-----------------------------------'
docker run \
           -e "TEST_REPO=$TEST_REPO" \
           -e "TEST_NAME=$TEST_NAME" \
           -e "VERBOSE=$VERBOSE" \
           -e "TEST_PROCESSES=$TEST_PROCESSES" \
           -e "TEST_DURATION=$TEST_DURATION" \
           -e "TEST_CONNECTIONS=$TEST_CONNECTIONS" \
 "$IMG_MOLOTOV" 
echo '-----------------------------------'
date
echo '-----------------------------------'
