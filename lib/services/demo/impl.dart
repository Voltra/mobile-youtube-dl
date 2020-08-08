import 'package:injectable/injectable.dart';
import '../../di/env.dart';
import './interface.dart';

@Environment(Env.prod)
@LazySingleton(as: DemoService)
class Demo implements DemoService {
  @override
  int answer() => 42;
}
