#Define all paths, constants here
PROJECT_DIR='C:/Users/Rutvij/Documents/Digital Public Transport/'
OUTPUT_DIR='C:/Users/Rutvij/Documents/Digital Public Transport/build/app/outputs/flutter-apk/'
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
#Start Build Process
print_blue "\n\n\nStarting Build Process"
wait
print_blue "\n\n\nChecking Dependencies"
flutter doctor -v
wait
print_blue "\n\n\nGet Packages"
flutter pub get
wait
print_blue "\n\n\nBuilding now...\n"
flutter build apk --split-per-abi --no-shrink
wait
print_blue "\n\n\n Build Created...\n"
#Install APK on device / emulator
print_blue "\n\n\nInstalling APK on emulator...\n"
flutter install app-armeabi-v7a-release.apk
print_blue "Done Installing\n"
print_blue "\n\n\n Launching Now..\n"
wait
#Launch Main Activity
adb shell am start -n "com.example.authentification/com.example.authentification.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
print_blue "\n\n\n Launched main activity\n"
print_green "\n\n\nNow Lets Start the test\n"
sleep 120
sh ./auto.sh
wait
print_green "\n\n\n Testing Completed\n"
#Copy APK to output folder
cp "$PROJECT_DIR"build/app/outputs/apk/debug/app-debug.apk $OUTPUT_DIR
print_blue "\n\n\nCopying APK to outputs For Release\n"
print_blue "\n\n\nDone\n"
