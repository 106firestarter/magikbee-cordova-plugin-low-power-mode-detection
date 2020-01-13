/********* lowPowerModeDetection.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@interface lowPowerModeDetection : CDVPlugin {
  // Member variables go here.
}

- (void)isLowPowerModeEnabled:(CDVInvokedUrlCommand*)command;
@end

@implementation lowPowerModeDetection

- (void)isLowPowerModeEnabled:(CDVInvokedUrlCommand*)command
{
  NSLog(@"Batery State Changed");

  CDVPluginResult* pluginResult = nil;

  if (command == nil) {
      // Failure
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
  } else {
      bool isLowPowerModeEnabled = [[NSProcessInfo processInfo] isLowPowerModeEnabled];
      // Success
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isLowPowerModeEnabled];
  }

  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
