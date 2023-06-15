#!/bin/bash
if [ $USER == HAD ]; then
    declare -A capacities
    while read -r -a line; do
        mess=${line[0]}
        capacity=${line[1]}
        capacities[$mess]=$capacity
    done <<< $(head -4 /home/HAD/mess.txt | tail -3)
    # echo ${capacities[@]}
    while read -r -a line;
    do
        if [ $line ]
        then
        rollno=${line[0]}
        messpref=${line[2]}
        name=${line[1]}
        p3=$((messpref%10))
        na=$((messpref/10))
        p2=$((na%10))
        nb=$((na/10))
        p1=$((nb%10))
        # echo hi
        for i in $p1 $p2 $p3;do
            if [ "${capacities[$i]}" -gt 0 ]
            then
                echo "$rollno has been allocated mess $i"
                truncate -s-1 /home/$name/userdetails.txt
                echo -n " $i $(date "+%B")" >> /home/$name/userdetails.txt
                capacities[$i]=$((capacities[$i]-1))
            fi
            break
        done
        fi
    done <<< $(tail -n +6 /home/HAD/mess.txt)
else
user=$USER
read -p "Enter Your mess preference order" messpref
cat /home/$user/userdetails.txt | while read -r -a line;
do
    truncate -s-1 /home/$user/userdetails.txt
    echo -n " $messpref" >> /home/$user/userdetails.txt
    rollno=${line[1]}
    name=${line[0]}
    echo -e "\n $rollno $name $messpref $(date)" | cat >> /home/HAD/mess.txt
done
fi

