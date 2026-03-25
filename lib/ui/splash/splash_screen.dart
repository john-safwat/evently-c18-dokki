import 'package:evently_c18_dokki/core/provider/app_config_provider.dart';
import 'package:evently_c18_dokki/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_setup/app_setup_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        user != null ? HomeScreen.routeName : AppSetupScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(),
            Expanded(
              child: Image.asset(
                "assets/images/${provider.isDark ? "logo_dark.png" : "logo_light.png"}",
                width: width * 0.85,
              ),
            ),
            Image.asset(
              "assets/images/${provider.isDark ? "branding_dark.png" : "branding_light.png"}",
              width: width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
