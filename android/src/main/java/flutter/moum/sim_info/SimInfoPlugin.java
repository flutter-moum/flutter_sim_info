package flutter.moum.sim_info;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.telephony.TelephonyManager;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;
import androidx.core.app.ActivityCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SimInfoPlugin */
public class SimInfoPlugin implements MethodCallHandler {
  private final Activity mActivity;
  private final TelephonyManager mTelephonyManager;

  private SimInfoPlugin(Activity activity) {
    mActivity = activity;
    mTelephonyManager = (TelephonyManager) activity.getSystemService(Context.TELEPHONY_SERVICE);
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "sim_info");

    channel.setMethodCallHandler(new SimInfoPlugin(registrar.activity()));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (hasPermission(Manifest.permission.READ_PHONE_STATE)) {
      result.error("Permission Denied", null, null);
      return;
    }

    switch (call.method) {
      case "allowsVOIP":
        result.success(true);
        break;
      case "carrierName":
        getCarrierName(result);
        break;
      case "isoCountryCode":
        break;
      case "mobileCountryCode":
        break;
      case "mobileNetworkCode":
        break;
      case "getPlatformVersion":
        getPlatformVersion(result);
        break;
      default:
        result.notImplemented();
    }
  }

  @SuppressWarnings("SameParameterValue")
  private boolean hasPermission(String permission) {
    return PackageManager.PERMISSION_DENIED ==
            ContextCompat.checkSelfPermission(mActivity, permission);
  }

  private void getCarrierName(@NonNull Result result) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
      String carrierName = mTelephonyManager.getSimCarrierIdName().toString();
      result.success(carrierName);
    }
  }
  private String getIsoCountryCode() {
    return "";
  }
  private String getMobileCountryCode() {
    return "";
  }
  private String getMobileNetworkCode() {
    return "";
  }

  private boolean isSimStateReady() {
    return true;
  }


  private void getPlatformVersion(Result result) {
    result.success("Android " + android.os.Build.VERSION.RELEASE);
  }
}
