import 'package:flutter/material.dart';

class AdsView extends StatelessWidget {
  final Widget child;
  AdsView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
