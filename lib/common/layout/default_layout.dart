import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //입력받은 색상이 없다면 흰색
      backgroundColor: backgroundColor ?? Colors.white,
      body: child,
    );
  }
}
class hello extends StatelessWidget {
  const hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

