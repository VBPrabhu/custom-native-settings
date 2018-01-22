#import "CDVNativeSettings.h"
#import <Cordova/CDV.h>

@implementation CDVNativeSettings

- (void)openSettings:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;

   NSString* key = [command.arguments objectAtIndex:0];
   NSString* prefix = @"App-Prefs:";

   NSURL* url;

    BOOL canOpenSettings = (&UIApplicationOpenSettingsURLString != NULL);
    if (canOpenSettings) {
       if ([key isEqualToString:@"account"]) {           
            url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"about"]) {
            
            if(SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10.3.3")){

                url = [NSURL URLWithString: @"App-Prefs:root=About"];
                [[UIApplication sharedApplication] openURL:url];
            }else{

                url = [NSURL URLWithString: @"App-Prefs:root=About"];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }          
        }else if ([key isEqualToString:@"touchid"]) {
            
            if(SYSTEM_VERSION_LESS_THAN(@"10.0.0")){

                NSURL *url = [NSURL URLWithString:@"prefs:root=TOUCHID_PASSCODE"];
                [[UIApplication sharedApplication] openURL:url];
            } if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0.0") && SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10.3.3")  ){

                NSURL *url = [NSURL URLWithString:@"App-Prefs:root=TOUCHID_PASSCODE"];
                [[UIApplication sharedApplication] openURL:url];
            } else {

                url = [NSURL URLWithString:@"App-Prefs:root=TOUCHID_PASSCODE"];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }else if ([key isEqualToString:@"location"]) {
             
            if(SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10.3.3")){
                url = [NSURL URLWithString:@"App-Prefs:root=General&path=Restrictions"];
                [[UIApplication sharedApplication] openURL:url];
            }else{
                url = [NSURL URLWithString:@"App-Prefs:root=General&path=Restrictions"];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }else if ([key isEqualToString:@"application_details"]) {            
            url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"wifi"]) {
           
            if(SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10.0")){
                url = [NSURL URLWithString:@"App-Prefs:root=WIFI"];
                [[UIApplication sharedApplication] openURL:url];
            }else{
                url = [NSURL URLWithString:@"App-Prefs:root=WIFI"];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }else if ([key isEqualToString:@"general"]) {
           
            if(SYSTEM_VERSION_LESS_THAN(@"10.0.0")){

                NSURL *url = [NSURL URLWithString:@"prefs:root=General"];
                [[UIApplication sharedApplication] openURL:url];
            } if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0.0") && SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"10.3.3")  ){

                NSURL *url = [NSURL URLWithString:@"App-Prefs:root=General"];
                [[UIApplication sharedApplication] openURL:url];
            } else {

                url = [NSURL URLWithString:@"App-Prefs:root=General"];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
