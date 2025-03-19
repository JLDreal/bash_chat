#!/bin/bash
chat=""
mback=0
msg=""
c_path="/home/dvs/jschlich/chat"
count=0
step=1
delimiter="#"
hell=1

while getopts "hc:m:n:" opt
do
	case $opt in 
		h) echo -e "

 __  __  ___   ___ 
(  \/  )/ __) / __)
 )    ( \__ \( (_-.
(_/\/\_)(___/ \___/

  

the backend protocol                          
                     
-c chatname 
-m message
-n number of messages you want to go back and see"
hell=0;;

		c) chat=$OPTARG;;

		m) msg=$OPTARG;;

		n) mback=$OPTARG;;
	esac		
			
done	


if [ 0 = $hell ]
	then
		echo
	else
	
		if [ -z "$chat" ]
			
		then
			echo "ERROR
	public chats:"
			ls $c_path
		else
			if [ 0 = "$mback" ]
				then 
				
					if [ -z "$msg" ]

							then 
								echo "ERROR"
							else
								zeit=$(date "+%T.%N")
								user=$HOME
								
								chmod -f ugo+rwx "$c_path/$chat"
								echo "$zeit # $user # $msg " >>"$c_path/$chat"

						fi
					
				else

					#sback=$(grep -n "$user" "$c_path/$chat" | grep "SEEN" | tail -n 1 | cut -d":" -f 1)
					#slast=$(grep -n "" "$c_path/$chat" | tail -n 1 | cut -d":" -f 1)

					#mback=$(($slast-sback))
					
					for OUTPUT	in $(seq $mback)
					do 
					some=$(tail -n 1 "$c_path/$chat" | cut -d" " -f 3)
						if [ "$some" != "SEEN" ]
							then
								num=$(($mback-$count))
								t1=$(tail -n$num "$c_path/$chat" 2>> "$c_path/.tmperr")
								
								time=$(echo "$t1" | head -n 1 | cut -d$delimiter -f 1 | cut -d"." -f 1)
								name=$(echo "$t1" | head -n 1 | cut -d$delimiter -f 2 | rev | cut -d"/" -f 1 | rev ) 
								message=$(echo "$t1" | head -n 1 | cut -d$delimiter -f 3- ) 
								 
								count=$(($count + $step))
								if [ true ]
								then
								printf "$time"" : ""$name"" : ""$message""\n"
								fi
							else 
							
								count=$(($count + $step))

						fi

					done
			fi
				
		fi

fi
