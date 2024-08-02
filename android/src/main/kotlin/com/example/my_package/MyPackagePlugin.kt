package com.example.my_package

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** MyPackagePlugin */
class MyPackagePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context=flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "my_package")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
        "getPlatformVersion" -> {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        "setGoogleMapKey" -> {
          val mapKey:String? = call.argument("key")
          mapKey.let {
            var setMapSucces = setMapKey(it)
            if(setMapSucces){
              result.success(true)
            }else{
              result.success(false)
            }
          }
        }
      "getGoogleMapKey"->{
        val data=getMapKey();
        Log.d("Tag", "onMethodCall: data is $data")
        result.success(data)
      }
        else -> {
          result.notImplemented()
        }
    }
  }

  private fun setMapKey(mapKey: String?):Boolean {
    Log.d("Tag", "_setMapKey ==>${mapKey}")

    try {


      val applicationInfo =
        getPackageInfo(context)
      if(mapKey!=null){
        applicationInfo.metaData.putString("com.google.android.geo.API_KEY", mapKey)
      }
       val data:String? = applicationInfo.metaData.getString("com.google.android.geo.API_KEY")
      Log.d("Tag", "_data ==>${data}")

      return data.equals(mapKey)
    } catch (e: PackageManager.NameNotFoundException) {
      e.printStackTrace()
      return false
    }
  }
  private fun getMapKey():String? {
    Log.d("Tag", "getMapKey")

    try {


      val applicationInfo = getPackageInfo(context)
      val data:String? = applicationInfo.metaData.getString("com.google.android.geo.API_KEY")
      Log.d("Tag", "getApi ==>${data}")
      return  data;
    } catch (e: PackageManager.NameNotFoundException) {
      e.printStackTrace()
      return null
    }
  }
  private fun getPackageInfo(context: Context): ApplicationInfo {
    val packageManager = context.packageManager
    val packageName:String=context.packageName
    Log.d("TAG", "getPackageInfo: $packageName")
    return  packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
