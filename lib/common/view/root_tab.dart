import 'package:flutter/material.dart';
import 'package:inputform_proj/common/const/colors.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: Center(
        child: Text('RootTab'),
      ),
      //default_layout.dart에 있는 bottomNavigationBar를 사용
      //BottomNavigationBar에 있는 속성들을 이용함
      //onTap과 currentIndex를 사용하려면 statefulwidget을 사용해야 함
      //onTap과 currentIndex를 사용하여 선택한 아이템을 바꿀 수 있음
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined), label: '음식'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: '주문'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: '프로필'),
          ]),
    );
  }
}
