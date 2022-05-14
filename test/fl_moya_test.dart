import 'package:flutter_test/flutter_test.dart';
import 'package:fl_moya/fl_moya.dart';
import 'package:fl_moya/fl_moya_platform_interface.dart';
import 'package:fl_moya/fl_moya_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlMoyaPlatform 
    with MockPlatformInterfaceMixin
    implements FlMoyaPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlMoyaPlatform initialPlatform = FlMoyaPlatform.instance;

  test('$MethodChannelFlMoya is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlMoya>());
  });

  test('getPlatformVersion', () async {
    FlMoya flMoyaPlugin = FlMoya();
    MockFlMoyaPlatform fakePlatform = MockFlMoyaPlatform();
    FlMoyaPlatform.instance = fakePlatform;
  
    expect(await flMoyaPlugin.getPlatformVersion(), '42');
  });
}
