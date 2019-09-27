#import "FlutterSimInfoPlugin.h"
#import <flutter_sim_info/flutter_sim_info-Swift.h>

@implementation FlutterSimInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSimInfoPlugin registerWithRegistrar:registrar];
}
@end
