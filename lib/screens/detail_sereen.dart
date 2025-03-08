import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';

class DetailSereen extends StatelessWidget {
  final WebtoonModel webtoon;
  const DetailSereen({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(webtoon.title, style: TextStyle(fontSize: 24)),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ],
      ),
    );
  }
}
