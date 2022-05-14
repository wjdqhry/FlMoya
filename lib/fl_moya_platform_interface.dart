import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fl_moya_method_channel.dart';

abstract class FlMoyaPlatform extends PlatformInterface {
  /// Constructs a FlMoyaPlatform.
  FlMoyaPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlMoyaPlatform _instance = MethodChannelFlMoya();

  /// The default instance of [FlMoyaPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlMoya].
  static FlMoyaPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlMoyaPlatform] when
  /// they register themselves.
  static set instance(FlMoyaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
