echo -e "\n"
echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++DISCLAIMER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e "Crafted by @ashishsangra@protonmail.com\n"
echo -e "Starting Test\n"
read -p "Number of iterations: " j
i=1

while [[ $i -le $j ]]
do
 echo -n "Probe-$i :: ";curl -w 'Local IP: %{local_ip}; Host: %{remote_ip}; Return HTTP Code: %{http_code}; Bytes received: %{size_download}; Response time: %{time_total}; Download Speed: %{speed_download}\n' $1 -m 2 -o /dev/null -s
  i=$(($i+1))
   done | tee /dev/tty | awk '{print $17}' | awk '{sum+=$1;}END{print "Average response time=",sum}'
                                                                                                                                                                                       ✔

