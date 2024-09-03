import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String routeName = "splashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/splash.png",
      fit: BoxFit.cover,
    );
  }
}
