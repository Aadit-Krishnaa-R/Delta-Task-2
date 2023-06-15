file="/home/HAD"
read -p "Do You Want to Enter the Student Details(y/n)" choice
if [ $choice == y ]
then
    read -p "Enter your Name" name
    read -p "Enter your RollNo" rollno
    read -p "Enter your Hostel" hostel
    read -p "Enter your Room" room
    echo "$name $rollno $hostel $room" >> ./studentDetails.txt
else
    #create users for hostels
    for i in GarnetA GarnetB Agate Opal; do  
        #making directories in /home/HAD so HAD can access files
        sudo mkdir ${file}/$i
        sudo useradd -s /bin/bash -d /home/$i -m $i
        #making the announcements file inside HAD
        sudo touch ${file}/$i/announcements.txt
        sudo touch ${file}/$i/feeDefaulters.txt
        #copying it to Hostel directory so warden can access it
        sudo cp ${file}/$i/announcements.txt /home/$i/announcements.txt
        sudo cp ${file}/$i/feeDefaulters.txt /home/$i/feeDefaulters.txt
        sudo cp ./studentDetails.txt /home/$i
    #Adding Update Defaulter 
    echo "alias updateDefaulter='~/updateDefaulter.sh'" | sudo tee -a /home/$i/.bashrc >/dev/null
    done
    cat studentDetails.txt | tail -n +2 > samp2.txt && mv samp2.txt studentDetails.txt
    detailsfile="./studentDetails.txt"
    cat $detailsfile | while read -r -a line;
    do 
        Name=${line[0]}
        Rollno=${line[1]}
        Hostel=${line[2]}
        Room=${line[3]}
        Mess=${line[4]}
        MessPref=${line[5]}
        if [[ $Rollno == 1021* ]]
        then
        dept=Chemical
        elif [[ $Rollno == 1031* ]]
        then 
        dept=Civil
        elif [[ $Rollno == 1061* ]]
        then
        dept=CS
        elif [[ $Rollno == 1071* ]]
        then
        dept=EEE
        elif [[ $Rollno == 1081* ]]
        then 
        dept=ECE
        elif [[ $Rollno == 1101* ]]
        then 
        dept=ICE
        elif [[ $Rollno == 1111* ]]
        then
        dept=Mech
        elif [[ $Rollno == 1121* ]]
        then
        dept=Meta
        else
        dept=Prod
        fi
        sudo useradd -s /bin/bash -d /home/$Name -m $Name
        # Making Directories inside /home/HAD/Hostel so HAD can view all directories
        mkdir -p ${file}/$Hostel/$Room/$Name
        # Making Directories inside /home/Hostel so HostelWarden can view
        mkdir -p /home/$Hostel/$Room/$Name
        # creating the userdetails
        sudo touch ${file}/$Hostel/$Room/$Name/userdetails.txt
        # Copying the userdetails to Hostel Account and Student Account
        echo "$Name $Rollno $dept First Year $Hostel $Messpref" | cat >> ${file}/$Hostel/$Room/$Name/userdetails.txt
        sudo cp ${file}/$Hostel/$Room/$Name/userdetails.txt /home/$Hostel/$Room/$Name/userdetails.txt
        sudo cp ${file}/$Hostel/$Room/$Name/userdetails.txt /home/$Name/userdetails.txt
        sudo cp ${file}/$Hostel/announcements.txt /home/$Name/announcements.txt
        sudo cp ${file}/$Hostel/feeDefaulters.txt /home/$Name/feeDefaulters.txt
        sudo cp ./feeBreakup.sh /home/$Name/feeBreakup.sh
        sudo cp ./feebreakup.txt /home/$Name/feebreakup.txt
        sudo cp ./updateDefaulter.sh /home/$Hostel/updateDefaulter.sh 
        sudo touch /home/$Name/fees.txt
        sudo cp /home/$Name/fees.txt /home/$Hostel/$Room/$Name/fees.txt
        sudo chmod o=rwx /home/$Name/fees.txt
        sudo chmod o+x /home/$Name/feeBreakup.sh
        sudo chmod o+x /home/$Hostel/updateDefaulter.sh
        sudo cp ./messAllocation.sh /home/$Name/messAllocation.sh
        sudo cp ./messAllocation.sh /home/HAD/messAllocation.sh
        sudo chmod o+x /home/$Name/messAllocation.sh
        sudo chmod o+x /home/HAD/messAllocation.sh
        #Addig feeBreakup and messallocation to bashrc of respective students
        echo "alias feeBreakup='~/feeBreakup.sh'" | sudo tee -a /home/$Name/.bashrc >/dev/null
        echo "alias messAllocation='~/messAllocation.sh'" | sudo tee -a /home/$Name/.bashrc >/dev/null

    done
fi
#Adding MessAllocation.sh to HAD bashrc file
echo "alias messAllocation='~/messAllocation.sh'" | sudo tee -a /home/HAD/.bashrc >/dev/null
sudo cp ./mess.txt ./apache/mess.txt