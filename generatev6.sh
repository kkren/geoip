make_ros() {
  local dir=$1
  local name=$2
  echo "/ipv6 firewall address-list remove [/ip firewall address-list find list=$name]"
  echo "/ipv6 firewall address-list"

  for file in $1/*.txt; do
    while read line; do
      echo "add address=$line disabled=no list=$name"
    done < $file
  done
}

# Generate backward Compatibility address-list.rsc
make_ros $1 $2 > $3
