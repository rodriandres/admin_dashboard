import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {

  
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'resistant-white-logo.png',
            width: 50,
            height: 50,
          ),


          SizedBox(height: 20),

          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Happening now', 
              style: GoogleFonts.montserratAlternates(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          ),
        ],
      ),
    );
  }
}