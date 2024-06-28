import 'package:flutter/material.dart';

/// 모든 뷰에 한번에 바꿀 수 있음.
class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final Widget? bottomNavbar;

  const DefaultLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavbar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppbar(),
      body: child,
      bottomNavigationBar: bottomNavbar,
    );
  }

  AppBar? renderAppbar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
