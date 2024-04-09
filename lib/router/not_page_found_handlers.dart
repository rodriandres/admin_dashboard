

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/views/not_page_found_view.dart';

class NotPageFoundHandlers {

  static Handler notPageFound = Handler(
    handlerFunc: (context, params) {
      Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl( '/404' );

      return const NotPageFoundView();
    }
  );
}