#!/bin/sh

start() {
  [ -z "$(pidof -x $1)" ] && ${2:-$1} &
}

sleep 60 && start volumeicon &
