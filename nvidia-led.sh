#! /bin/bash

styles="/home/*/.config/nvidia-led/styles"

set_brightness() {
  nvidia-settings -a GPULogoBrightness=$1 > /dev/null 2>&1
}

test_value() {
  if [[ ! $3 =~ ^-?[0-9]+$ ]]; then
    return 1
  fi
  [[ $3 -ge $1 && $3 -le $2 ]]
}

test_range() {
  if [[ $3 != *"-"* ]]; then
    return 1
  fi
  min=$(echo $3 | cut -d "-" -f1)
  max=$(echo $3 | cut -d "-" -f2)
  if $(test_value $1 $2 $min) && $(test_value $1 $2 $max); then
    [ $min -le $max ];
  else
    return 1
  fi
}

show_help() {
  echo "nvidia-led: Awesome effects for NVIDIA GeForce GTX leds"
  echo "Usage: nvidia-led [options] [values]"
  echo -e "\nOptions:"
  for animation in $(ls $styles); do
    echo "  $(source $styles/$animation info)"
  done
  echo -e "\nValues:"
  echo "  intensity     Light intensity of effect. Type: Integer/Range [0-100]. E.g., 80, 10-50, 0-100"
  echo "  interval      Interval time of effect. Type: Integer [1-100]. E.g., 20, 100, 70"
  exit 0
}

custom_style() {
  if [[ $(ls $styles | grep $1.sh) ]]; then
    source $styles/$1.sh $2 $3 $4
  else
    echo "Unknown argument. Try: 'nvidia-led help'"
  fi
}

# MAIN
case "$1" in
  no-animation) source $styles/no-animation.sh $2 ;;
  flashing) source $styles/flashing.sh $2 $3 ;;
  dual-flashing)  source $styles/dual-flashing.sh $2 $3 ;;
  breathing)  source $styles/breathing.sh $2 $3 $4  ;;
  help) show_help ;;
  "") echo "Unknown argument. Try: 'nvidia-led help'" ;;
  *)  custom_style $1 $2 $3 $4  ;;
esac