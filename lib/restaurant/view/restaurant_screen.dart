import 'package:inputform_proj/common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inputform_proj/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> pagenateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    //http 요청을 함
    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );

    //돌아온 데이터 값
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: pagenateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot){
              if(!snapshot.hasData){
                return Container();
              }

              return ListView.separated(
                //가져온 데이터 값의 길이
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index){
                  final item = snapshot.data![index];
                  return RestaurantCard(
                    image: Image.network(
                      'http://$ip${item['thumbUrl']}',
                      fit: BoxFit.cover,
                    ),
                    // image: Image.asset(
                    //   'asset/img/food/ddeok_bok_gi.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                    name: item['name'],
                    //태그의 경우는 List<String>이기 때문에 List.from을 사용해야함 디폴트는 다이나믹인 것을 string 리스트로 변환해줌
                    tags: List<String>.from (item['tags']),
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                    ratings: item['ratings'],
                  );
                },
                separatorBuilder: (_, index){
                  return SizedBox(height: 16.0,);
                }
              );
            },
          )
        ),
      ),
    );
  }
}
