#!/bin/bash

tweak_fan()
(
	while true; do
		sio_temp=$(($(cat temp2_input) / 1000))
		if ((sio_temp < 45)); then
			echo 32 > pwm2
		elif ((sio_temp < 55)); then
			echo 64 > pwm2
		elif ((sio_temp < 65)); then
			echo 128 > pwm2
		else
			echo 255 > pwm2
		fi
		sleep 5
	done
)

main()
(
	modprobe it87 || exit 1
	cd /sys/class/hwmon/hwmon2 || exit 2
	tweak_fan > /dev/null
)

main &
