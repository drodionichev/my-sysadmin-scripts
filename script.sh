#!/usr/bin/env bash

INTERVAL=30
LOG_FILE="monitor.log"

[ "${INTERVAL}" -gt 0 ] 2> /dev/null
if [ $?  -gt 0 ];then
	echo "Ошибка в INTERVAL=${INTERVAL}, он должен быть целым числом больше 0"
	exit 1
fi

touch "${LOG_FILE}" 2> /dev/null
if [ $? -gt 0 ];then
	echo "Ошибка, нет доступа к добавлению или редактированию ${LOG_FILE}"
	exit 1
fi

for command in free df uptime;do
	which "$command" > /dev/null

	if [ $? -gt 0 ];then
		echo "Ошибка, команды ${command}  не существует"
		exit 1
	fi
done

echo "Запускаю мониторинг сервера"

while true; do
	date_now=$(date "+--- %Y-%m-%d %H:%M:%S ---")
	echo "${date_now}" >> "${LOG_FILE}"
	free -h >> "${LOG_FILE}"
	df -h >> "${LOG_FILE}"
	uptime >> "${LOG_FILE}"

	sleep "${INTERVAL}"
done
