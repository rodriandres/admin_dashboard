import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [

          // TODO BURGUER ICON
          IconButton(onPressed: (){}, icon: const Icon( Icons.menu_outlined )),
          const SizedBox(width: 5),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Center(
              child: const SearchText()
            ),
          ),

          const Spacer(),

          const NotificationsIndicator(),

          const SizedBox(width: 10),

          const NavbarAvatar(),

          const SizedBox(width: 10),

        
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      ),
    ]
  );
}