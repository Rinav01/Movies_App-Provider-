import 'package:flutter/material.dart';
import 'package:provider/widgets/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyErrorWidget(errorText: "errorText", retryFunction: () {}),
      ),
    );
  }
}
