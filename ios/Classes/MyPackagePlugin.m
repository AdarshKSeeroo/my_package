#import "MyPackagePlugin.h"
#import "GoogleMaps/GoogleMaps.h"
@implementation MyPackagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"my_package"
            binaryMessenger:[registrar messenger]];
  MyPackagePlugin* instance = [[MyPackagePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if([@"setGoogleMapKey" isEqualToString:call.method]){

  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
