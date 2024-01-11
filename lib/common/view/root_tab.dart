import 'package:flutter/material.dart';
import 'package:inputform_proj/common/const/colors.dart';
import 'package:inputform_proj/common/layout/default_layout.dart';
import 'package:inputform_proj/restaurant/view/restaurant_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

//vsync: this를 사용하기 위해 with SingleTickerProviderStateMixin을 사용
class _RootTabState extends State<RootTab> with
  SingleTickerProviderStateMixin {
  //나중에 사용할 때에는 이 값이 선언되어있을꺼야라고 가정
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 4, vsync: this);
    
    controller.addListener(tabListener);

  }
  //컨트롤러에 리스너 추가
  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  //컨트롤러에 리스너 제거
  @override
  void dispose() {
    // TODO: implement dispose
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: Center(
        child: TabBarView(
          //수평의 스크롤을 막음
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children:[
            RestaurantScreen(),
            Center(
              child: Container(
                child: Text('음식'),
              ),
            ),
            Center(
              child: Container(
                child: Text('주문'),
              ),
            ),
            Center(
              child: Container(
                child: Text('프로필'),
              ),
            ),
          ],
        ),
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
            //컨트롤러를 이용해서 탭뷰랑 바텀네비게이션바를 연결
            controller.animateTo(index);
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
