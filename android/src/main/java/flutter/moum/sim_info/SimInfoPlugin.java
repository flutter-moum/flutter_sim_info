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
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter.moum.sim_info");

    channel.setMethodCallHandler(new SimInfoPlugin(registrar.activity()));
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (hasPermission(Manifest.permission.READ_PHONE_STATE)) {
      result.error("PERMISSION_DENIED", null, null);
      return;
    }
    if (!isSimStateReady()) {
      result.error("SIM_STATE_NOT_READY", null, null);
      return;
    }

    switch (call.method) {
      case "allowsVOIP":
        result.success(true);
        break;
      case "carrierName":
        result.success(getCarrierName());
        break;
      case "isoCountryCode":
        result.success(getIsoCountryCode());
        break;
      case "mobileCountryCode":
        result.success(getMobileCountryCode());
        break;
      case "mobileNetworkCode":
        result.success(getMobileNetworkCode());
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

  private boolean isSimStateReady() {
    return TelephonyManager.SIM_STATE_READY == mTelephonyManager.getSimState();
  }

  private String getCarrierName() {
    String networkOperatorName = mTelephonyManager.getNetworkOperatorName();
    if (networkOperatorName == null) return "null";
    return networkOperatorName;
  }
  private String getIsoCountryCode() {
    String simCountryIso = mTelephonyManager.getSimCountryIso();
    if (simCountryIso == null) return "null";
    return simCountryIso;
  }
  private String getMobileCountryCode() {
    if (getMccMnc() == null || getMccMnc().length() < 5) return "null";
    return getMccMnc().substring(0, 3);
  }
  private String getMobileNetworkCode() {
    if (getMccMnc() == null || getMccMnc().length() < 5) return "null";
    return getMccMnc().substring(3);
  }

  private String getMccMnc() {
    return mTelephonyManager.getSimOperator();
  }


  private void getPlatformVersion(Result result) {
    result.success("Android " + android.os.Build.VERSION.RELEASE);
  }
}
