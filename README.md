# Cordova Settings Plugin
by [Venkat Prabhu]

## Description

* Allows you to access the iOS Settings panel for the currently running App
* This will not work on versions of iOS

## Installation

```
$ cordova plugin add custom-native-settings
$ cordova prepare
```

## Usage

```
settings.openSettings();
```
OpenNative plugin is used to Open Native settings screen from Cordova application for iOS 10.1

The plugin allows you to open Settings view from Android Cordova application and to open Native App settings view from iOS 8 Cordova application. 
Adding the Plugin to your project

    cordova plugin add https://github.com/VBPrabhu/custom-native-settings.git

Removing the Plugin to your project

cordova plugin rm custom-native-settings

Using the plugin (opens Location Settings  and Application Settings in iOS)

##Declaration :


    export var window: Window;

    interface Window {
    settings: any;
    }
declare var window: Window;

##Plugin call:


        this._platform.ready().then(() => {
            window.settings.openSettings("touchid");
        });


Select one of the options below for the param to open native setting

    "account",
    "application_details",
    "location",
    "wifi",
    "touchid",
     "about"
     "generali"  -- navigate default general settings page

##Reference:


https://stackoverflow.com/questions/45543983/how-to-open-location-services-from-ios-application-for-ios-11-beta

********************************************************************************************************