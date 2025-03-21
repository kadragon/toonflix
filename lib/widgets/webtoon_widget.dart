import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/screens/detail_sereen.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoon;

  const Webtoon({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailSereen(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                webtoon.thumb,
                headers: const {"Referer": "https://comic.naver.com"},
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(webtoon.title, style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
