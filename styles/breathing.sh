#! /bin/bash

animation() {
  test_range 0 100 $1 || show_help
  test_value 1 100 $2 || show_help
  interval=$(echo "$(($2*2)) 1000" | awk '{printf "%.3f", $1/$2}')

  brightness=$max
  fadeAmount=10

  while true; do
    set_brightness $brightness

    if [ "$brightness" -le $min ];then
      fadeAmount=-$fadeAmount
      sleep 1
    elif [ "$brightness" -ge $max ]; then
      fadeAmount=-$fadeAmount
    fi

    test_value 0 100 $((brightness+=fadeAmount)) || brightness=$min

    sleep $interval
  done
}

show_info() {
  echo "breathing <intensity> <interval>      Breathing animation"
}

show_help() {
  echo "Usage: nvidia-led breathing <intensity> <interval>"
  echo -e "\nValues:"
  echo "  intensity     Type: Range [0-100]. E.g., 20-80, 10-50, 0-100"
  echo "  interval      Type: Integer [1-100]. E.g., 20, 100, 70"
  exit 0
}

case "$1" in 
  help) show_help ;;
  info) show_info ;;
  *)  animation $1 $2 ;;
esac