#!/usr/bin/env bash

INTERVAL=60
LOG_FILE="monitor.log"
echo "Запускаю мониторинг сервера"

while true; do
	date_now=$(date "+--- %Y-%m-%d %H:%M:%S ---")
	echo "${date_now}" >> "${LOG_FILE}"
	free -h >> "${LOG_FILE}"
	df -h >> "${LOG_FILE}"
	uptime >> "${LOG_FILE}"

	sleep "${INTERVAL}"
done
