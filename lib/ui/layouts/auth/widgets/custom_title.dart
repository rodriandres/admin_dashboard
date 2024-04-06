import 'package:flutter/cupertino.dart';
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

          Row(
            children: [
              Image.asset(
                'resistant-white-logo.png',
                width: 50,
                height: 50,
              ),
          
              const SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Resistant is',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

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