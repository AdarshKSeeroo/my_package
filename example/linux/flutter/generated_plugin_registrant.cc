//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <my_package/my_package_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) my_package_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MyPackagePlugin");
  my_package_plugin_register_with_registrar(my_package_registrar);
}
