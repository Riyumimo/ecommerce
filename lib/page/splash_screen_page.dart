import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splashscreen';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),()=>Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 400,
              width: 400,
              child: Image.network(
                "https://i.pinimg.com/originals/6b/f6/c3/6bf6c378aa6f7aeae3f28b756642fb4e.jpg",
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Hero Knight",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
