//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

CF_EXPORT CFTypeRef MTActuatorCreateFromDeviceID(UInt64 deviceID);
CF_EXPORT IOReturn MTActuatorOpen(CFTypeRef actuatorReference);
CF_EXPORT IOReturn MTActuatorClose(CFTypeRef actuatorReference);
CF_EXPORT IOReturn MTActuatorActuate(CFTypeRef actuatorReference, SInt32 actuationID, UInt32 arg1, Float32 arg2, Float32 arg3);

NS_ASSUME_NONNULL_END
