import 'package:flutter/material.dart';
import 'package:flutter_practice/common/const/colors.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image; // 이미지
  final String name; // 레스토랑 이름
  final List<String> tags; // 레스토랑 태그
  final int ratingsCount; // 평점 갯수
  final int deliveryTime; // 배송 걸리는 시간
  final int deliveryFee; // 배송 비용
  final double ratings; // 평균 평점

  const RestaurantCard(
      {super.key,
      required this.image,
      required this.name,
      required this.tags,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: image,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              tags.join(' · '),
              style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14),
            ),
            const SizedBox(height: 8),
          ],
        ),
        Row(
          children: [
            _IconText(icon: Icons.star, label: ratings.toString()),
            renderDot(),
            _IconText(icon: Icons.receipt, label: ratingsCount.toString()),
            renderDot(),
            _IconText(icon: Icons.timelapse_outlined, label: '$deliveryTime 분'),
            renderDot(),
            _IconText(
                icon: Icons.monetization_on,
                label: deliveryFee == 0 ? '무료' : deliveryFee.toString())
          ],
        )
      ],
    );
  }
  renderDot(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text('·',style: TextStyle(fontSize: 12,
      fontWeight: FontWeight.w500), ),
    );
  }
}


class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 14),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

