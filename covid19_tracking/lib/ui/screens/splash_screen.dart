import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 800),
  )..forward();
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
  );

  Future checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      final snackBar = SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, color: Colors.black),
            const SizedBox(width: 10),
            const Text(
              'No Internet Connection',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Acme',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/logo/logo.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width / 2,
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'COVID19 TRACKING',
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 2.5,
                  fontFamily: 'Sirin-Stencil',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
              child: const RiveAnimation.asset(
                'assets/rive/hourglass.riv',
                animation: 'Play',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
