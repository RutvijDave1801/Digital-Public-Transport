from appium import webdriver

"""
Desired Capabilities
"""

desired_cap = {
    "deviceName": "emulator-5554",
    "platformName": "android",
    "app": "C:/Users/Rutvij/Documents/Digital Public Transport/build/app/outputs/apk/debug/app-debug.apk",
    "appWaitPackage": "com.example.authentification",
    "appWaitActivity": ".MainActivity",
    "noReset": "true",
    "automationName": "UiAutomator2"
}
# crete the driver instance

driver = webdriver.Remote("http://localhost:4723/wd/hub", desired_cap)
driver.implicitly_wait(129)
el1 = driver.find_element_by_accessibility_id("Open navigation menu")
el1.click()
el2 = driver.find_element_by_accessibility_id("Home")
el2.click()
el3 = driver.find_element_by_accessibility_id("Open navigation menu")
el3.click()
el4 = driver.find_element_by_accessibility_id("Register")
el4.click()
el6 = driver.find_element_by_accessibility_id("SignUp")
el6.click()
el7 = driver.find_element_by_accessibility_id("Back")
el7.click()
el8 = driver.find_element_by_accessibility_id("Login")
el8.click()
el9 = driver.find_element_by_accessibility_id("LOGIN")
el9.click()
el10 = driver.find_element_by_accessibility_id("Back")
el10.click()
el11 = driver.find_element_by_accessibility_id("Payment")
el11.click()
el13 = driver.find_element_by_accessibility_id("Back")
el13.click()
el14 = driver.find_element_by_accessibility_id("QR_Code")
el14.click()
el15 = driver.find_element_by_accessibility_id("Scan QR")
el15.click()
el16 = driver.find_element_by_accessibility_id("Scan QR")
el16.click()
el17 = driver.find_element_by_xpath("/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.TextView[2]")
el17.click()
el18 = driver.find_element_by_accessibility_id("Back")
el18.click()
el19 = driver.find_element_by_accessibility_id("Generate QR")
el19.click()
el20 = driver.find_element_by_accessibility_id("Generate QR")
el20.click()
el21 = driver.find_element_by_accessibility_id("Back")
el21.click()
el22 = driver.find_element_by_accessibility_id("Back")
el22.click()
el23 = driver.find_element_by_accessibility_id("Back")
el23.click()
el24 = driver.find_element_by_accessibility_id("Logout")
el24.click()
