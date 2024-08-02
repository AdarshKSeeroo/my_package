#include "include/my_package/my_package_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "my_package_plugin.h"

void MyPackagePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  my_package::MyPackagePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
