echo -e "\n"
echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++DISCLAIMER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e "Crafted by @ashishsangra@microsoft.com\n"
echo -e "Starting Test\n"
echo -n "Number of iterations: "
read j
i=1

while [[ $i -le $j ]] 
do
 echo -n "Probe-$i :: ";curl -w 'Local IP: %{local_ip}; Host: %{remote_ip}; Return HTTP Code: %{http_code}; Bytes received: %{size_download}; Response time: %{time_total}; Download Speed: %{speed_download}\n' $1 -m 2 -o /dev/null -s 
 i=$(($i+1)) 
 done | tee /dev/tty | awk '{ sum += $15; n++ } END { if (n > 0) print "Average Resp Time=",sum / n; }'
