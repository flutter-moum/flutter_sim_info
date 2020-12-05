package flutter.moum.sim_info;

import android.content.Context;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

class MethodHandlerImpl implements MethodChannel.MethodCallHandler {

    Context context;
    private final TelephonyManager mTelephonyManager;
    public MethodHandlerImpl() {
        mTelephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
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
            default:
                result.notImplemented();
        }
    }
    @SuppressWarnings("SameParameterValue")
    private boolean hasPermission(String permission) {
        return PackageManager.PERMISSION_DENIED ==
                ContextCompat.checkSelfPermission(context, permission);
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
}
