#! /bin/bash

animation() {
  test_value 0 100 $1 || show_help

  set_brightness $1
}

show_info() {
  echo "no-animation <intensity>                      Fixed brightness"
}

show_help() {
  echo "Usage: nvidia-led no-animation <intensity>"
  echo -e "\nValues:"
  echo "  intensity     Type: Integer [0-100]. E.g., 0, 70, 100"
  exit 0
}

case "$1" in 
  help) show_help ;;
  info) show_info ;;
  *)  animation $1 ;;
esac