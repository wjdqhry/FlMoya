import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fl_moya_platform_interface.dart';

/// An implementation of [FlMoyaPlatform] that uses method channels.
class MethodChannelFlMoya extends FlMoyaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fl_moya');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
