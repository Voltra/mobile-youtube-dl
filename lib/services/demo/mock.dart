import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import '../../di/env.dart';
import './interface.dart';

@Environment(Env.test)
@LazySingleton(as: DemoService)
class MockDemo extends Mock implements DemoService {
  @override
  int answer() => 3024;
}
