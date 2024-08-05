import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/my_package.dart';
import 'package:my_package/my_package_method_channel.dart';
import 'package:my_package/my_package_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyPackagePlatform
    with MockPlatformInterfaceMixin
    implements MyPackagePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> setGoogleMapKey({required String key}) {
    return Future.value(true);
  }

  @override
  Future<String?> getGoogleMapKey() {
   return Future.value("adaa");
  }
}

void main() {
  final MyPackagePlatform initialPlatform = MyPackagePlatform.instance;

  test('$MethodChannelMyPackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyPackage>());
  });

  test('getPlatformVersion', () async {
    MyPackage myPackagePlugin = MyPackage();
    MockMyPackagePlatform fakePlatform = MockMyPackagePlatform();
    MyPackagePlatform.instance = fakePlatform;

    expect(await myPackagePlugin.getPlatformVersion(), '42');
  });
}
