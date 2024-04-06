import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background_widget.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  
  final Widget child;
  
  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          (size.width > 1000)
            ? _DesktopBody(child: child)
            : _MobileBody(child: child),

          // Linksbar
          LinksBar(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [

          // Image Background
          const CustomBackgroundImage(),

          // View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTitle(),
                const SizedBox(height: 50),
                Expanded(
                  child: child
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          SizedBox(height: 20),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),

          Container(
            width: double.infinity,
            height: 400,
            child: const CustomBackgroundImage(),
          )
        ],
      ),
    );
  }
}