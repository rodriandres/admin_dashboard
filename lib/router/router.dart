
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/dashboard_handlers.dart';
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
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  
  static String ordersRoute = '/dashboard/orders';
  static String analitycRoute = '/dashboard/analityc';
  static String categoriesRoute = '/dashboard/categories';
  static String productsRoute = '/dashboard/products';
  static String discountRoute = '/dashboard/discount';
  static String customersRoute = '/dashboard/customers';
  static String marketingRoute = '/dashboard/marketing';
  static String campaignRoute = '/dashboard/campaign';


  static void configuredRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NotPageFoundHandlers.notPageFound;
  }
}