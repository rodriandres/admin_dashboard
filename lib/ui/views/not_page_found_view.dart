import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotPageFoundView extends StatelessWidget {
  const NotPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '404 - Page not found',
          style: GoogleFonts.montserratAlternates(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}