import 'package:flutter/material.dart';
import 'package:flutter_practice/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter_practice/common/const/data.dart';
import 'package:flutter_practice/restaurant/model/restaurant_model.dart';
import 'package:flutter_practice/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  // Future - async http 요청
  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return resp.data['data']; // data 안에 있는 것만 필요함 (중요)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FutureBuilder<List>(
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                //print(snapshot.error); // 토큰 만료됐으니까 401에러 뜸.
                //print(snapshot.data);
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final item = snapshot.data![index];
                    final pItem=RestaurantModel.fromJson(json: item);

                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RestaurantDetailScreen()));
                      },
                      child: RestaurantCard.fromModel(
                        model : pItem
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
