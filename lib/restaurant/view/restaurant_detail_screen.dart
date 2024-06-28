import 'package:flutter/material.dart';
import 'package:flutter_practice/common/layout/default_layout.dart';
import 'package:flutter_practice/product/commponent/product_card.dart';
import 'package:flutter_practice/restaurant/component/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡볶이',
        child: CustomScrollView(
          slivers: [
            renderTop(),
            renderLabel(),
            renderProduct(),
          ],
        )


      // child: Column(
      //   children: [
      //     RestaurantCard(
      //         image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
      //         name: 'name',
      //         tags: ['a','b','c'],
      //         ratingsCount: 100,
      //         deliveryTime: 30,
      //         deliveryFee: 3000,
      //         ratings: 5.0,
      //       isDetail: true,
      //       detail: '맛있는 떡볶이입니다',
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: ProductCard(),
      //     ),
      //   ],
      // ));
    );
  }
  SliverPadding renderLabel(){
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text('메뉴',
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      ),
    );
  }

  renderProduct() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: ProductCard(),
                  );
            },
          childCount: 10
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: RestaurantCard(
        image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
        name: 'name',
        tags: ['a', 'b', 'c'],
        ratingsCount: 100,
        deliveryTime: 30,
        deliveryFee: 3000,
        ratings: 5.0,
        isDetail: true,
        detail: '맛있는 떡볶이입니다',
      ),
    );
  }
}
