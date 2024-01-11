//정보를 긁어와서 어떤 페이지로 보내야 하는지 판단하는 페이지
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inputform_proj/common/const/colors.dart';
import 'package:inputform_proj/common/const/data.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';
import 'package:inputform_proj/common/view/root_tab.dart';
import 'package:inputform_proj/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //deleteToken();
    checkToken();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  void checkToken() async {
    //token api 연동 로컬호스트임에도 딜레이가 있음 실전 서버임을 가정하고 서버 측 코드에서 500ms 딜레이가 존재하기 때문
    //토큰이 있는지 없는지 확인 있다면 로그인을 했다는 것이고 없다면 로그인을 안했다는 것

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    //토큰의 유효성까지 검사 하는 코드
    try {
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: {'authorization': 'Bearer $refreshToken'},
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => RootTab(),
        ),
        (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 16.0),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
