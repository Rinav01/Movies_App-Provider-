import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        
      ),
    );
  }
}