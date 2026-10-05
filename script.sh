#!/usr/bin/env bash

LOG_FILE="monitor.log"
date_now=$(date "+--- %Y-%m-%d %H:%M:%S ---")
echo "Анализирую лог: ${LOG_FILE}, текущее время: ${date_now}"

echo "${date_now}" >> "${LOG_FILE}"
free -h >> "${LOG_FILE}"
df -h >> "${LOG_FILE}"
uptime >> "${LOG_FILE}"
