import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../localization/AppLocalizations.dart';
import '../routing/router.gr.dart';

class P404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = AppLocalizations.of(context);
    final route = RouteData.of(context);
    final uri = route.routeMatch.uri;

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n("404.title")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(i18n("404.text")),
            Text(i18n("404.report") + " $uri"),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                ExtendedNavigator.of(context).push(Routes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
