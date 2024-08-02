import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_package_platform_interface.dart';

/// An implementation of [MyPackagePlatform] that uses method channels.
class MethodChannelMyPackage extends MyPackagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_package');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> setGoogleMapKey({required String key}) async {
    final isSuccess =
        await methodChannel.invokeMethod<bool>('setGoogleMapKey', {"key":key});
    return isSuccess;
  }

  @override
  Future<String?> getGoogleMapKey() async{
    return await methodChannel.invokeMethod<String>('getGoogleMapKey');
  }
}
