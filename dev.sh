#!/bin/sh

print_usage() {
	echo "Usage ./dev.sh start OR ./dev.sh stop"
}

start_development() {
	echo "Giving ownership of nixos/ to $USER"
	sudo chown -R $USER nixos/
}

stop_development() {
	echo "Giving ownership of nixos/ to root"
	sudo chown -R root nixos/
}

if [ $# -eq 0 ]; then
	echo "$0: Missing arguments"
	print_usage
	exit 1
elif [ $# -gt 1 ]; then
	echo "$0: Too many arguments: $@"
	print_usage
	exit 1
fi

if [ $1 = "start" ]; then
	echo "Starting development session"
	start_development
	exit 0
elif [ $1 = "stop" ]; then
	echo "Stopping development session"
	stop_development
	exit 0
else
	echo "$0: Invalid arguments: $@"
	print_usage
	exit 1
fi
