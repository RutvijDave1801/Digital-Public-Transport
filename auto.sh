print_red(){
    printf "\e[1;31m$1\e[0m"
}
print_green(){
    printf "\e[1;32m$1\e[0m"
}
adb shell input tap 324 1772
sleep 3 
adb shell input tap 196 1306
sleep 3 
adb shell input text 'rutvijdave@gmail.com'
sleep 3 
adb shell input tap 992 1924
sleep 3 
adb shell input tap 137 1433
sleep 3 
adb shell input text '11102993'
sleep 3 
adb shell input tap 992 1949
sleep 3 
echo "Please Verify that above Credentials takes proper inputs"
read -p 'Enter Valid Email ID: ' number1 
read -p 'Enter Valid Password: ' number2 
# Firstly Validate if any input field is left blank. If an input field is left blank, display appropriate message and stop execution of script 
if [ -z "$number1" ] || [ -z "$number2" ] 
then 
    print_red "Inputs cannot be blank please try again!"
    exit 0 
fi 
# Now Validate if the user input is a number using regex (Integer or Float). If not, display appropriate message and stop execution of script 
if [[ "$number1" = 'rutvijdave@gmail.com' ]] || [[ "$number2" = '11102993' ]] 
then 
    print_green "You have been validated to move further" 
	
else
	print_red "Sorry You cannot be Validated \n Test Case Failed " 
    exit 0 
fi
wait
adb shell input tap 137 1433
sleep 3 
adb shell input tap 992 1949
sleep 3
adb shell input tap 540 1591 # Login Button
sleep 3 
adb shell input tap 211 1502
sleep 3
adb shell input text 'AHMEDABAD'
sleep 3
adb shell input tap 196 947
sleep 3
adb shell input text 'ANAND'
sleep 3
adb shell input tap 196 1100
sleep 3
adb shell input text '1'
sleep 3
adb shell input tap 530 1375
sleep 20
adb shell input tap 476 383
sleep 3
adb shell input tap 908 1969
sleep 3
adb shell input tap 167 1335
sleep 3
adb shell input text '1'
sleep 3
adb shell input tap 530 1100
sleep 10 
adb shell input tap 270 992
#adb shell input tap 270 1252 #Transaction
sleep 3
adb shell input tap 245 1375
sleep 3
adb shell input text 'rutvijdave@scb'
sleep 5
adb shell input tap 997 1944
sleep 5
adb shell input tap 540 1537
sleep 5
adb shell input tap 540 1846
sleep 5
adb shell input tap 820 1178
sleep 3
adb shell input tap 540 1969
sleep 3
adb shell input tap 515 1699
sleep 5
adb shell input tap 712 1777
sleep 3
adb shell input tap 137 1296
sleep 3
adb shell input text 'rutvijdave'
sleep 3
adb shell input tap 992 1949
sleep 3
adb shell input tap 147 1448
sleep 3
adb shell input text 'rutvijdave1212@gmail.com'
sleep 3
adb shell input tap 992 1949
sleep 3
adb shell input tap 137 1591
sleep 3
adb shell input text '11102993'
sleep 3
adb shell input tap 992 1949
sleep 3
adb shell input tap 535 1748 #Login Register
sleep 3
adb shell input tap 211 1502
sleep 3
adb shell input text 'AHMEDABAD'
sleep 3
adb shell input tap 196 947
sleep 3
adb shell input text 'ANAND'
sleep 3
adb shell input tap 196 1100
sleep 3
adb shell input text '1'
sleep 3
adb shell input tap 530 1375
sleep 3
adb shell input tap 476 383 #snackbar
sleep 3
adb shell input tap 908 1969
sleep 3
adb shell input tap 167 1335
sleep 3
adb shell input text '1'
sleep 3
adb shell input tap 530 1100
sleep 10 
adb shell input tap 270 992
#adb shell input tap 270 1252 #Transaction
sleep 3
adb shell input tap 245 1375
sleep 3
adb shell input text 'rutvijdave@scb'
sleep 5
adb shell input tap 997 1944
sleep 5
adb shell input tap 540 1537
sleep 5
adb shell input tap 540 1846
sleep 5
adb shell input tap 820 1178
sleep 3
adb shell input tap 540 1969
sleep 3
adb shell input tap 515 1699
sleep 5
print_green "\n\n\n Testing Completed\n"
print_blue "\n\n\nCopying APK to outputs For Release\n"
print_blue "\n\n\nDone\n"
exit 0