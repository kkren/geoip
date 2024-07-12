make_ros() {
  local file=$1
  local name=$2
  echo "/ip firewall address-list remove [/ip firewall address-list find list=$name]"
  echo "/ip firewall address-list"
  while read line; do
    echo "add address=$line disabled=no list=$name"
  done < $file
}

# Generate backward Compatibility address-list.rsc
make_ros $1 $2 > $3
