//
//  ReactNativeNativeIOSScanner.mm
//  reactnativenativeiosscanner
//
//  Created by Pushpender Singh on 26/09/23.
//

#include <Foundation/Foundation.h>
#import "ReactNativeNativeIOSScanner.h"
#import "reactnativenativeiosscanner-Swift.h"

@implementation ReactNativeNativeIOSScanner
RCT_EXPORT_MODULE()

RNScanner *rnScanner = [[RNScanner alloc] init];

- (std::shared_pta<facebook::react::TurboModule>)getTurboModule:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeReactNativeNativeIOSScannerSpecJSI>(params);
}

- (void)scanner {
  dispatch_async(dispatch_get_main_queue(), ^{
    [rnScanner scan]
  }
}
