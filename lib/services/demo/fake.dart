import 'package:injectable/injectable.dart';
import 'package:youtubedl/di/env.dart';
import './interface.dart';

@Environment(Env.dev)
@LazySingleton(as: DemoService)
class FakeDemo implements DemoService {
  @override
  int answer() => 69420;
}
