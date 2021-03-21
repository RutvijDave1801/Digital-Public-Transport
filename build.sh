#Define all paths, constants here
PROJECT_DIR='C:/Users/Rutvij/Documents/Digital Public Transport'
OUTPUT_DIR='C:/Users/Rutvij/Documents/Digital Public Transport/build/app/outputs/flutter-apk'
# Functions for customising print colors (Optional)
print_red(){
    printf "\e[1;31m$1\e[0m"
}
print_green(){
    printf "\e[1;32m$1\e[0m"
}
print_yellow(){
    printf "\e[1;33m$1\e[0m"
}
print_blue(){
    printf "\e[1;34m$1\e[0m"
}
#Enter project dir
#cd $PROJECT_DIR
#Start Build Process
print_blue "\n\n\nStarting Build Process"
wait
print_blue "\n\n\nChecking Dependencies"
flutter doctor -v
wait
print_blue "\n\n\nGet Packages"
flutter pub get
wait
print_blue "\n\n\n building now...\n"
flutter build apk
wait
print_green "\n\n\n Build Completed...\n"
wait
#Install APK on device / emulator
print_blue "Checking For APK on emulator...\n"
#flutter install app-release.apk
print_blue "\n\n\n Done Checking\n"
print_blue "\n\n\n Launching Now..\n"
wait
#Launch Main Activity
adb shell am start -n "com.example.authentification/com.example.authentification.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
wait
#print_blue "\n\n\n Launched main activity\n"
print_green "\n\n\n Now Lets Start the test\n"
wait
sh ./auto.sh
wait
print_green "\n\n\n Testing Completed\n"
#Copy APK to output folder
cp "$PROJECT_DIR"/build/app/outputs/apk/debug/app-debug.apk $OUTPUT_DIR
print_blue "\n\n\nCopying APK to outputs For Release\n"
print_blue "\n\n\nDone\n"
