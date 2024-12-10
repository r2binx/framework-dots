#!/bin/sh

BAR_ID=''
while getopts 'w:b:' flag; do
  case "${flag}" in
  b) BAR_ID="${OPTARG}" ;;
  *)
    printf "${@}"
    exit 1
    ;;
  esac
done

SDIR="${HOME}/.config/waybar"
for i in /sys/class/hwmon/hwmon*/temp*_input; do
  if [ "$(<"$(dirname "${i}")"/name): $(cat "${i%_*}"_label 2>/dev/null || basename "${i%_*}")" = "coretemp: Package id 0" ]; then
    export HWMON_PATH="${i}"
    break
  fi
done

sed -i "s|{{HWMON_PATH}}|${HWMON_PATH}|" "${SDIR}/config"
/usr/bin/waybar -c "${SDIR}/config" -b "${BAR_ID}"
