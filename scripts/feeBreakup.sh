#!/bin/bash
totalfee=200000
Tutionfee=100000
Hostelrent=40000
Servicecharge=20000
Messfee=40000
read -p "Do You Want to pay your fees" choice
if [ $choice == y ]
then
    FILENAME=fees.txt
    if [ ! -s "${FILENAME}" ]; then
        read -p "Do You want to proceed to fee payment(y/n)" choice2
        if [ $choice2 == y ]
        then
            echo -e "\n\nFEE PAYMENT DETAILS" | cat >> fees.txt
            echo -e "TutionFee $Tutionfee\nHostelRent $Hostelrent\nServiceCharge $Servicecharge\nMessFee $Messfee" | cat >> fees.txt
            echo -e "\n Transcation Successfull" | cat >> fees.txt
            echo -e "\n Date of Transaction: \n$(date "+%D")" | cat >> fees.txt 
            echo "Payment Successfull"
        else
            echo "NO Issues see you later"
        fi
    else
        echo "Fee Payment has been done Already"
    fi
else
    echo "LEts Come Back Laterrr"
fi