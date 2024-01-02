import 'package:flutter/material.dart';
import 'package:inputform_proj/common/component/custom_text_form.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: '이메일을 입력해주세요.',
            onChanged: (String value) {},
          ),
          CustomTextFormField(
            hintText: '비밀번호를 입력해주세요.',
            onChanged: (String value) {},
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
