
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/not_page_found_view.dart';

class NotPageFoundHandlers {

  static Handler notPageFound = Handler(
    handlerFunc: (context, params) {
      return const NotPageFoundView();
    }
  );
}