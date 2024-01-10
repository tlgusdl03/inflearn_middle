//정보를 긁어와서 어떤 페이지로 보내야 하는지 판단하는 페이지
import 'package:flutter/material.dart';
import 'package:inputform_proj/common/const/colors.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: Column(
        children: [
          Image.asset('asset/img/logo/logo.png',
          width: MediaQuery.of(context).size.width / 2,
          ),
          const SizedBox(height: 16.0),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
