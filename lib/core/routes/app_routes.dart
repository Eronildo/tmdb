import 'package:flutter/widgets.dart';
import 'package:routefly/routefly.dart';
import 'package:tmdb/routes.g.dart';

sealed class AppRoutes {
  static RouterConfig<Object>? get routerConfig => Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.home,
      );
}
