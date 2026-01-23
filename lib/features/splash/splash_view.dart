import 'package:event/core/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../core/gen/assets.gen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RouteName.login),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Assets.images.logo.image(width: 135, height: 185)),
    );
  }
}
