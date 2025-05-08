import 'package:flutter/material.dart';
import 'package:provider_state_managements/widgets/error_widget.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          true
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading..."),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              )
              : MyErrorWidget(errorText: '_errorMessage', retryFunction: () {}),
    );
  }
}
