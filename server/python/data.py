#!/usr/bin/env python3

import mysql.connector

mycon = mysql.connector.connect(
    user='root', password='root', host='mysql', port="3306", database='db')
print("DB connected")


cur=mycon.cursor()


cur.execute("use db")

#CREATING TABLE
s1="Create Table studentdetails(Name varchar(30) NOT NULL,Rollno INTEGER PRIMARY KEY,Hostel varchar(10),Room Integer,Mess Integer,Messpref char(4),dept varchar(5),year Integer);"
cur.execute(s1)
#Finding Departments

def depart(rollno):
    r=(rollno//100000)
    # print(r)
    if (r == 1021):
        dept="Chem"
    elif (r == 1031):
        dept="Civil"
    elif (r == 1061):
        dept="CSE"
    elif (r == 1071):
        dept="EEE"
    elif (r == 1081):
        dept="ECE"
    elif (r == 1101):
        dept="ICE"
    elif (r == 1111):
        dept="Mech"
    elif (r == 1121):
        dept="Meta"
    else:
        dept="Prod"
    return dept

#INSERTING DATA

f = open("./studentDetails.txt")
p=f.readline()
datalist=f.readlines()
for line in datalist:
    l=line.split()
    clean = [ line.strip() for line in l ]
    ins="INSERT INTO studentdetails(Name,Rollno,Hostel,Room,Mess,Messpref,dept,year) VALUES('{}','{}','{}',{},{},'{}','{}',{})".format(clean[0],clean[1],clean[2],clean[3],clean[4],clean[5],depart(int(clean[1])),2022)
    cur.execute(ins)
    mycon.commit()
mycon.close()
# print("YES")