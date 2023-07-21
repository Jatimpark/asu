````
multiport v2

sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Jatimpark/asu/main/setup.sh && chmod +x setup.sh && screen -S install ./setup.sh

````
