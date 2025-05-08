import 'package:flutter/material.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    super.key,
    required this.errorText,
    required this.retryFunction,
  });
  final String errorText;
  final Function retryFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(MyAppIcons.error, size: 50, color: Colors.red),
          const SizedBox(height: 20),
          Text(
            'Error: $errorText',
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
