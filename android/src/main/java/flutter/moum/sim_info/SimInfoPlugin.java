package flutter.moum.sim_info;
import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

/** SimInfoPlugin */
public class SimInfoPlugin implements FlutterPlugin {
  private MethodChannel channel;

  private void setMethodChannel(Context context, BinaryMessenger messenger) {
    channel = new MethodChannel(messenger, "flutter.moum.sim_info");
    channel.setMethodCallHandler(new MethodHandlerImpl(context));
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    final Context context = binding.getApplicationContext();
    setMethodChannel(context, binding.getBinaryMessenger());
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
