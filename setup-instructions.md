# Setup instructions

## Prerequisites

 - [Android Studio](https://developer.android.com/studio) or any IDE to open Flutter project
 - JDK

## Installations

1. Install Flutter by following instructions from [flutter.dev](https://flutter.dev). To summarise:
   - Select the appropriate operating system
   - Download the flutter sdk to a preferred location on your local system.
2. Fork and clone the [soochit repository](https://github.com/MLH-Fellowship/soochit) repository to your local machine.
3. Make sure to install the **Flutter** and **Dart** plugins.
   - If Soochir is the first project that you will be viewing in Android Studio then:
       - Start Android Studio
       - Open Plugin Preferences
       - Browse repositories and search for flutter
       - Install and click yes to install Dart as well if prompted.
   - Flutter and dart can also be installed after opening a project.
       - Go to File menu -> Settings -> plugins
       - Search for the plugin. In this case it would be Flutter and Dart. Install them if not done yet and click Apply.

## Local Development Setup

 This section will help you set up the project locally on your system.

 1. Open the project on your IDE.
 2. Run `pub get` on project level terminal to install all the required dependencies.
 3. Ensure that the Flutter SDK is provided the correct path. Open File menu -> Settings -> Languages & Frameworks -> Flutter
 4. In order to run a flutter project, either a virtual device needs to be setup or a physical device can be used. Remember to `enable Debugging` in **Developer Options** in the physical device.
 5. Connect your physical device or setup the virtual device before you run the application. Ensure that the device is visible on top menu.

## Firebase Configurations
Follow the [official firebase documentation](https://firebase.google.com/docs/flutter/setup?platform=android) to connect firebase to the app locally. The following information, however, is required to set it up successfully.

* Name the firebase project `Soochit`.
* Before adding apps, go to Authentication under Develop, and click on the Set up sign-in method button. Enable `Phone` sign-in provider.
* Android package name: `com.example.soochit`
* Be sure to enter your SHA key so that authentication can work properly.

Refer to the Flutter [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

Huge shoutout to @anita-org's [mentorship-flutter](https://github.com/anitab-org/mentorship-flutter) for the detailed installation guide! 🚀
