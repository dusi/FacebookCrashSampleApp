# Sample project
1. Created empty iOS app project
2. Added [Facebook SDK](https://github.com/facebook/facebook-ios-sdk) dependency using SPM and only added `FacebookCore` to main app target

# Instructions
1. Checkout `AppDelegate.swift` to see that Facebook SDK's stack is being initialized based on [Getting Started](https://developers.facebook.com/docs/ios/getting-started) docs
2. Checkout `ViewController.swift` to see more details about the crash
3. Please note that `Info.plist` has not been updated to reflect [Getting Started](https://developers.facebook.com/docs/ios/getting-started) docs but it did not make any difference in mittigating the crash

# Crash stack trace
```
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=1, address=0x0)
    frame #0: 0x0000000192ca5fec libswiftCore.dylib`swift::SubstGenericParametersFromMetadata::SubstGenericParametersFromMetadata(swift::TargetMetadata<swift::InProcess> const*) + 24
    frame #1: 0x0000000192cae308 libswiftCore.dylib`swift_getAssociatedTypeWitnessSlowImpl(swift::MetadataRequest, swift::TargetWitnessTable<swift::InProcess>*, swift::TargetMetadata<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*, swift::TargetProtocolRequirement<swift::InProcess> const*) + 252
    frame #2: 0x0000000192caca8c libswiftCore.dylib`swift_getAssociatedTypeWitness + 52
    frame #3: 0x0000000192af0a6c libswiftCore.dylib`Swift._SwiftNewtypeWrapper< where τ_0_0: Swift.Hashable, τ_0_0.Swift.RawRepresentable.RawValue: Swift.Hashable>._rawHashValue(seed: Swift.Int) -> Swift.Int + 68
    frame #4: 0x0000000100631dd4 FacebookCrashSampleApp`protocol witness for Hashable._rawHashValue(seed:) in conformance FBSDKAppEventName at <compiler-generated>:0
    frame #5: 0x0000000192b2a154 libswiftCore.dylib`Swift._SwiftDeferredNSSet.member(Swift.AnyObject) -> Swift.Optional<Swift.AnyObject> + 260
    frame #6: 0x0000000192b2d360 libswiftCore.dylib`merged @objc Swift._SwiftDeferredNSDictionary.object(forKey: Swift.AnyObject) -> Swift.Optional<Swift.AnyObject> + 44
    frame #7: 0x00000001804a7718 CoreFoundation`-[NSSet containsObject:] + 52
  * frame #8: 0x0000000100660af4 FacebookCrashSampleApp`-[FBSDKLogger initWithLoggingBehavior:] at FBSDKLogger.m:35:15 [opt]
    frame #9: 0x00000001006564bc FacebookCrashSampleApp`-[FBSDKGraphRequestConnection init] at FBSDKGraphRequestConnection.m:274:15 [opt]
    frame #10: 0x000000010065bb00 FacebookCrashSampleApp`-[FBSDKGraphRequestConnectionFactory createGraphRequestConnection] at FBSDKGraphRequestConnectionFactory.m:18:10 [opt]
    frame #11: 0x0000000100677260 FacebookCrashSampleApp`-[FBSDKServerConfigurationManager loadServerConfigurationWithCompletionBlock:] at FBSDKServerConfigurationManager.m:178:63 [opt]
    frame #12: 0x0000000100676e24 FacebookCrashSampleApp`-[FBSDKServerConfigurationManager cachedServerConfiguration] at FBSDKServerConfigurationManager.m:120:5 [opt]
    frame #13: 0x00000001006d3f68 FacebookCrashSampleApp`Settings.checkAutoLogAppEventsEnabled(self=0x0000600003e04100) at Settings+AutoLogAppEvents.swift:20:36 [opt]
    frame #14: 0x00000001006d5044 FacebookCrashSampleApp`Settings.logIfSDKSettingsChanged() [inlined] FBSDKCoreKit.Settings.isAutoLogAppEventsEnabled.getter : Swift.Bool(self=0x0000600003e04100) at Settings.swift:83:11 [opt]
    frame #15: 0x00000001006d5040 FacebookCrashSampleApp`Settings.logIfSDKSettingsChanged(self=0x0000600003e04100) at Settings+Logging.swift:62:17 [opt]
    frame #16: 0x00000001006d53fc FacebookCrashSampleApp`@objc Settings.logIfSDKSettingsChanged() at <compiler-generated>:0 [opt]
    frame #17: 0x0000000100697918 FacebookCrashSampleApp`ApplicationDelegate.initializeSDK(launchOptions:) [inlined] FBSDKCoreKit.ApplicationDelegate.logInitialization(self=0x0000600002120a00) -> () at ApplicationDelegate.swift:145:25 [opt]
    frame #18: 0x00000001006978e8 FacebookCrashSampleApp`ApplicationDelegate.initializeSDK(launchOptions=nil, self=0x0000600002120a00) at ApplicationDelegate.swift:74:5 [opt]
    frame #19: 0x0000000100697d50 FacebookCrashSampleApp`ApplicationDelegate.application(application=0x0000000100e04960, launchOptions=nil, self=0x0000600002120a00) at ApplicationDelegate.swift:319:5 [opt]
    frame #20: 0x0000000100632048 FacebookCrashSampleApp`AppDelegate.application(application=0x0000000100e04960, launchOptions=nil, self=0x0000600000217f40) at AppDelegate.swift:9:36
    frame #21: 0x000000010063212c FacebookCrashSampleApp`@objc AppDelegate.application(_:didFinishLaunchingWithOptions:) at <compiler-generated>:0
    frame #22: 0x00000001852eccfc UIKitCore`-[UIApplication _handleDelegateCallbacksWithOptions:isSuspended:restoreState:] + 312
    frame #23: 0x00000001852ee15c UIKitCore`-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:] + 2788
    frame #24: 0x00000001852f2c7c UIKitCore`-[UIApplication _runWithMainScene:transitionContext:completion:] + 856
    frame #25: 0x00000001849a0820 UIKitCore`-[_UISceneLifecycleMultiplexer completeApplicationLaunchWithFBSScene:transitionContext:] + 148
    frame #26: 0x00000001852eff70 UIKitCore`-[UIApplication _compellApplicationLaunchToCompleteUnconditionally] + 44
    frame #27: 0x00000001852f02c0 UIKitCore`-[UIApplication _run] + 832
    frame #28: 0x00000001852f3f5c UIKitCore`UIApplicationMain + 124
    frame #29: 0x00000001847a33a8 UIKitCore`UIKit.UIApplicationMain(Swift.Int32, Swift.Optional<Swift.UnsafeMutablePointer<Swift.UnsafeMutablePointer<Swift.Int8>>>, Swift.Optional<Swift.String>, Swift.Optional<Swift.String>) -> Swift.Int32 + 100
    frame #30: 0x00000001006322f4 FacebookCrashSampleApp`static UIApplicationDelegate.main() at <compiler-generated>:0
    frame #31: 0x000000010063226c FacebookCrashSampleApp`static AppDelegate.$main(self=@thick FacebookCrashSampleApp.AppDelegate.Type) at <compiler-generated>:0
    frame #32: 0x0000000100632370 FacebookCrashSampleApp`main at AppDelegate.swift:5:7
    frame #33: 0x0000000100b21544 dyld_sim`start_sim + 20
    frame #34: 0x0000000100c5a0e0 dyld`start + 2360
```
