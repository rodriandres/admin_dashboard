
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/not_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // Home
  static String rootRoute = '/';
  // Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard routes
  static String dashboardRoute = '/dashboard';


  static void configuredRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NotPageFoundHandlers.notPageFound;
  }
}