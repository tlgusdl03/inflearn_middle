import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inputform_proj/common/component/custom_text_form.dart';
import 'package:inputform_proj/common/const/colors.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //dio를 두번 사용하기 위한 인스턴스 생성
    final dio = Dio();

    //안드로이드 에뮬레이터 ip주소 10.0.2.2
    //ios 시뮬레이터 ip주소는 같다.
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    return DefaultLayout(
      child: SingleChildScrollView(
        //화면을 스크롤 가능하게 만드는 위젯
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        //화면을 스크롤하면 키보드가 내려가게 함
        child: SafeArea(
          //안짤리고 화면 안에 들어오게 하는 위젯
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16.0), // const SizedBox(height: 8.0
                _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CustomTextFormField(
                  hintText: '이메일을 입력해주세요.',
                  onChanged: (String value) {},
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  onChanged: (String value) {},
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  //api 연동 비동기로 진행하기 위해 async 사용
                  onPressed: () async {
                    // ID:PassWord
                    final rawString = 'test@codefactory.ai:testtest';

                    // Base64로 인코딩하는 코드, 어떻게 인코딩할지 정의함
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    // 인코딩된 값을 token에 저장
                    String token = stringToBase64.encode(rawString);

                    final resp = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {'authorization': 'Basic $token'},
                      ),
                    );
                    print(resp.data);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: PRIMARY_COLOR,
                  ),
                  child: Text('로그인'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text('회원가입'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('환영합니다!',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ));
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
