package flutter.moum.sim_info;
import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SimInfoPlugin */
public class SimInfoPlugin implements FlutterPlugin {
  private MethodChannel channel;


  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    SimInfoPlugin plugin = new SimInfoPlugin();
    plugin.setMethodChannel(registrar.context(), registrar.messenger());
  }

  private void setMethodChannel(Context context, BinaryMessenger messenger) {
    channel = new MethodChannel(messenger, "flutter.moum.sim_info");
    channel.setMethodCallHandler(new MethodHandlerImpl());

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
