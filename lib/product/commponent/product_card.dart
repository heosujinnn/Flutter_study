import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';
import 'package:flutter_practice/restaurant/model/restaurant_detail_model.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard(
      {super.key,
      required this.image,
      required this.name,
      required this.detail,
      required this.price});

  factory ProductCard.fromModel({
    required RestaurantProductModel model,
  }) {
    return ProductCard(
        image: Image.network(model.imgUrl,
            width: 110, height: 110, fit: BoxFit.cover),
        name: model.name,
        detail: model.detail,
        price: model.price);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // 오 신기해.. 최대 크기 만큼 차지하게 됨 !!
      //row 안에서는 최대 높이 하고 싶을 때 IntrinsicHeight 감싸주세요
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: image,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500)),
              Text(detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: BODY_TEXT_COLOR,
                      fontWeight: FontWeight.w500)),
              Text(price.toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.green,
                      fontWeight: FontWeight.w500)),
            ],
          ))
        ],
      ),
    );
  }
}
