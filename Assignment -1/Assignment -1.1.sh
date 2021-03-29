#!/bin/bash
# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo "Internet: Connected"  >> /tmp/Test.txt || echo "Internet: Disconnected"  >> /tmp/Test.txt

# Check Disk Usages
echo -e "Disk Usages :" >> /tmp/Test.txt
df -h| grep 'Filesystem\|/dev/sda*' >> /tmp/Test.txt

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "Load Average :" $loadaverage  >> /tmp/Test.txt

cat /tmp/Test.txt
rm -rf /tmp/Test.txt
