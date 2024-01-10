import 'package:flutter/material.dart';
import 'package:inputform_proj/common/component/custom_text_form.dart';
import 'package:inputform_proj/common/view/splash_screen.dart';
import 'package:inputform_proj/user/view/login_screen.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
