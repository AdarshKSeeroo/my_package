import 'my_package_platform_interface.dart';

class MyPackage {
  Future<String?> getPlatformVersion() {
    return MyPackagePlatform.instance.getPlatformVersion();
  }

  Future<bool?> setGoogleMapKey({required String key}) {
    return MyPackagePlatform.instance.setGoogleMapKey(key: key);
  }
  Future<String?> getGoogleMapKey() {
    return MyPackagePlatform.instance.getGoogleMapKey();
  }
}
