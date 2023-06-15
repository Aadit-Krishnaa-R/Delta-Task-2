sudo chmod o=rwx /home/HAD
#changing the group of Hostels to HAD so HAD can view all files inside
for i in GarnetA GarnetB Agate Opal; do
    sudo chgrp HAD /home/$i
    chmod g=rwx /home/$i
    # adding HAD and respective hostel warden into a group which can access the home directories of all students
    sudo groupadd -f ${i}OWN
    sudo usermod -aG ${i}OWN $i
    sudo usermod -aG ${i}OWN HAD
    sudo chgrp ${i}OWN /home/$i/announcements.txt
    sudo chmod g=rwx /home/$i/announcements.txt
    sudo chgrp ${i}OWN /home/$i/feeDefaulters.txt
    sudo chmod g=rwx /home/$i/feeDefaulters.txt
    sudo chmod o-x /home/HAD/$i
done
sudo cp ./mess.txt /home/HAD/mess.txt
#Giving HAD permission to home directory of all students and respective hostel warden the access to their student home directories
cat studentDetails.txt | while read -r -a line;
do 
    Name=${line[0]}
    Hostel=${line[2]}
    sudo chgrp ${Hostel}OWN /home/$Name
    sudo chmod g=rwx /home/$Name
    sudo cp ./mess.txt /home/$Name/mess.txt
    sudo chown $Name /home/$Name/userdetails.txt
    sudo chgrp ${Hostel}OWN /home/$Name/feeDefaulters.txt
    sudo chgrp ${Hostel}OWN /home/$Name/announcements.txt
    sudo chmod g=rwx /home/$Name/feeDefaulters.txt
    sudo chmod g=rwx /home/$Name/announcements.txt
    sudo chgrp HAD /home/$Name/userdetails.txt
    sudo chmod g=rwx /home/$Name/userdetails.txt
done