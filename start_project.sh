#!/bin/bash

#поскольку при выполнении скрипта возникали ошибки, скрипт оставила в таком виде
cd /opt || { echo "Не удалось перейти в /opt"; exit 1; }

if ! command -v git &> /dev/null
then
    echo "Git не установлен, установка..."
    sudo apt-get install git -y
fi

if ! git clone https://github.com/KuzminaAn/shvirtd-example-python.git; then
    echo "Ошибка клонирования репозитория."
fi

cd shvirtd-example-python || { echo "Не удалось перейти в shvirtd-example-python"; exit 1; }

if ! sudo docker compose up -d; then
    echo "Ошибка запуска docker-compose."
    exit 1
fi
