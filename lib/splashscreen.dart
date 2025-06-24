import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/page_1.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf3f4),
body: Center(
  child: Image.asset("assets/gif/logo_animation.gif"),
),
    );
  }
}
