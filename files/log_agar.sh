#!/bin/bash
echo "AgAR Service Log"

journalctl _SYSTEMD_INVOCATION_ID=`systemctl show -p InvocationID --value agar.service`
