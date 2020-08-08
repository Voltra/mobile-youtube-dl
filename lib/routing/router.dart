import 'package:auto_route/auto_route_annotations.dart';
import '../pages/404.dart';
import '../pages/Home.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: Home, initial: true),
    AdaptiveRoute(path: "*", page: P404),
  ],
)
class $Router {}
