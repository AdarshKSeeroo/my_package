import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_package_method_channel.dart';

abstract class MyPackagePlatform extends PlatformInterface {
  /// Constructs a MyPackagePlatform.
  MyPackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static MyPackagePlatform _instance = MethodChannelMyPackage();

  /// The default instance of [MyPackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelMyPackage].
  static MyPackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyPackagePlatform] when
  /// they register themselves.
  static set instance(MyPackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> setGoogleMapKey({required String key}) {
    throw UnimplementedError('setGoogleMap has not been implemented.');
  }
  Future<String?> getGoogleMapKey() {
    throw UnimplementedError('getGoogleMap has not been implemented.');
  }
}
