#!/bin/bash

useradd -m -s /bin/bash hihi

echo "root:$mypasswd" | chpasswd
echo "hihi:hihi" | chpasswd

service ssh restart

sleep infinity