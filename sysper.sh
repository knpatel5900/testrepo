#!/bin/bash
bold=`tput smso`
unbold=`tput rmso`
under=`tput smul`
nounder=`tput rmul`
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
#bldred=${txtbld}$(tput setaf 1) #  red
#bldblu=${txtbld}$(tput setaf 4) #  blue
#bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)
tme=`date`
hostname=`hostname`
clear;
headtop()
{
tput cup  5 20 ; echo "${bold} # # # # # # A U T E F A  O P E R A T I O N   M E N U # # # # # # ${unbold}"
tput cup  0 93 ; echo "${bold}Time&Date${unbold} ==>$tme"
tput cup  1 97 ; echo "${bold}Hostname${unbold} ==>$hostname"
}
menu()
{
tput cup  9 29 ; echo "| --------------------------- |";
tput cup 10 29 ; echo "| |1. Hostname               | |";
tput cup 11 29 ; echo "| |2. IP-Address            | |";
tput cup 12 29 ; echo "| |3. Top 15 Process        | |";
tput cup 13 29 ; echo "| |4. Memory Status         | |";
tput cup 14 29 ; echo "| |5. Disk Partition/Space  | |";
tput cup 15 29 ; echo "| |6. Error in Log          | |";
tput cup 16 29 ; echo "| |7. CronTab Detail        | |";
tput cup 17 29 ; echo "| --------------------------- |";
tput cup 18 29 ; echo "+=============================+";
}
inpu()
{
tput cup 20 42 ; echo "<== ${bold}E/e for Exit${unbold}";
tput cup 20 31 ; echo -n "CHOICE:: "; read choice;
}

input1()
{
menu
tput cup 20 30 ; echo "You Have Entered the Incorrect Input";
}
headtop
menu
inpu
input1


case $choice in 
		

1)
clear;
tput cup  8 29 ; echo "+=======${bold} $Hostname ${unbold}=======+";
tput cup  9 35 ; echo "$hostname";
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;

2)
clear;
tput cup  8 15 ; echo "+=======${bold} IP-Address$ ${unbold}=======+";
ip a
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;

3)
clear;
tput cup  8 29 ; echo "Top 15 Process";
top 
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;

4)
clear;
tput cup  8 15 ; echo "+=======${bold}Memory Status ${unbold}=======+";
vmstat
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;

5)
clear;
tput cup  8 15 ; echo "+=======${bold}Disk Space ${unbold}=======+";
df -kH
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;

6)
clear;
cat /var/log/messages | grep error | more
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;
7)
clear;
cat /var/log/cron | more
echo "Press Any Key to Main Menu" ; read any;
exec /root/sysper.sh
;;
E|e)
clear;
exit
;;

*)
tput cup 21 31 ; echo "You Have Entered the Incorrect Input";
tput cup 22 31 ; echo "Your input is ==> ${bold} $choice ${unbold} <== Which is Incorrect";
tput cup 23 31 ; echo -n "Press Enter the to Continue... "; read cont;
clear;
exec /root/sysper.sh
;;

esac



