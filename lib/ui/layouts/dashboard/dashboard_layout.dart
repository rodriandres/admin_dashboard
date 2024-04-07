import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardLayout extends StatelessWidget {

  final Widget child;

  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [

          const SideBar(),

          Expanded(
            child: Column(
              children: [
                
                // Navbar
                const Navbar(),

                // View
                Expanded(child: child),
            
              ],
            ),
          )
          // View container
        ],
      )
    );
  }
}