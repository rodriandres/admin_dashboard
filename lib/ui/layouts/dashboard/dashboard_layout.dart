import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration( milliseconds: 300)
    );
  }
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700)
                const SideBar(),
          
              Expanded(
                child: Column(
                  children: [
                    
                    // Navbar
                    const Navbar(),
          
                    // View
                    Expanded(
                      child: Container(
                        child: widget.child
                      ),
                    ),
                
                  ],
                ),
              )
              // View container
            ],
          ),

          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, _ ) {
                return Stack(
                  children:
                  [ 

                    if (SideMenuProvider.isOpen)
                      Opacity(
                        opacity: SideMenuProvider.opacity.value,
                        child: GestureDetector(
                          onTap: () => SideMenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black26,
                          ),
                        ),
                      ),

                    Transform.translate(
                      offset: Offset( SideMenuProvider.movement.value, 0),
                      child: const SideBar(),
                    ),

                  ]
                );
              }
            ),
        ]
      )
    );
  }
}