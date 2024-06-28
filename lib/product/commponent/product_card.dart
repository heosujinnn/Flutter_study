import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // 오 신기해.. 최대 크기 만큼 차지하게 됨 !!
      //row 안에서는 최대 높이 하고 싶을 때 IntrinsicHeight 감싸주세요
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset('asset/img/food/ddeok_bok_gi.jpg',
                width: 110, height: 110, fit: BoxFit.cover),
          ),
          SizedBox(width: 16),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('떡볶이',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              Text('정통 떡볶이 입니다: \n 맛도리deddjjdjjjdjdjdjdjjdjjdjdeedededed',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: BODY_TEXT_COLOR,
                      fontWeight: FontWeight.w500)),
              Text('100000원',
                  textAlign: TextAlign.right,
                  style: TextStyle(
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
