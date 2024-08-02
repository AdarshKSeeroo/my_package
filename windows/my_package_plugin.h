#ifndef FLUTTER_PLUGIN_MY_PACKAGE_PLUGIN_H_
#define FLUTTER_PLUGIN_MY_PACKAGE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace my_package {

class MyPackagePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MyPackagePlugin();

  virtual ~MyPackagePlugin();

  // Disallow copy and assign.
  MyPackagePlugin(const MyPackagePlugin&) = delete;
  MyPackagePlugin& operator=(const MyPackagePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace my_package

#endif  // FLUTTER_PLUGIN_MY_PACKAGE_PLUGIN_H_
