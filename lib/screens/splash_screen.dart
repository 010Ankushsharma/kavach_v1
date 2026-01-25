import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kavach_v1/screens/scan_crop_screen.dart';

import '../constants/app_colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Navigate to HomePage after 2 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScanScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 180,
              width: 180,
              child: Image(
                image: AssetImage('assets/logo/logo.png'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'KAVACH',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome Farmers',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
