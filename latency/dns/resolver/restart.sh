while true
do
  ./sdns -config=./config.yml & SDNS_PID=$!
  sleep 3
  kill $SDNS_PID
done