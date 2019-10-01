#import "SimInfoPlugin.h"
#import <sim_info/sim_info-Swift.h>

@implementation SimInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimInfoPlugin registerWithRegistrar:registrar];
}
@end
