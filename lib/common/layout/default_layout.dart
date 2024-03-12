import 'package:flutter/material.dart';

/// 모든 뷰에 한번에 바꿀 수 있음.
class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
