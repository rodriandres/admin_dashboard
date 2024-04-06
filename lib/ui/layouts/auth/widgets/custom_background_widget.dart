import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackgroundImage(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30) ,
            child: Image(
              image: AssetImage('resistant-white-logo.png'),
              width: 400
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() =>
   const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('twitter-bg.png'),
      fit: BoxFit.cover
    )
   );
}