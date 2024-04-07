import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://pics.craiyon.com/2023-07-14/cc8344ac3330478c826c39a570b37591.webp'),
        width: 40,
        height: 40,
      ),
    );
  }
}