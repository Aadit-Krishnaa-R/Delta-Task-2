#!/bin/bash
read -p "Enter the deadline for fee payment" dead_date
cat studentDetails.txt | while read -r -a line;
do 
    Name=${line[0]}
    Rollno=${line[1]}
    Hostel=${line[2]}
    Room=${line[3]}
    Mess=${line[4]}
    MessPref=${line[5]}
    # echo $Name
    if [ $USER == $Hostel ]
    then
        if test -s /home/$Name/fees.txt
        then
            date=$(tail -n 1 /home/$Name/fees.txt)    
            if [ "$date" \> "$dead_date" ]
            then
                echo -e "\n$Name" | cat >> /home/$Hostel/feeDefaulters.txt
            elif [ "$date" \< "$dead_date" ]
            then
                echo "Students Who Have paid The fees" | cat >> /home/$Hostel/announcements.txt
                echo -e "\n$Name" | cat >> /home/$Hostel/announcements.txt
            else
                echo error
            fi
        else
            echo -e "\n$Name" | cat >> /home/$Hostel/feeDefaulters.txt
        fi
        cp /home/$Hostel/announcements.txt /home/$Name/announcements.txt
        cp /home/$Hostel/feeDefaulters.txt /home/$Name/feeDefaulters.txt
    fi
done