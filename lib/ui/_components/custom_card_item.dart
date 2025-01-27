import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final String imageUrl; // 이미지 URL
  final String title; // 책 제목
  final String? author; // 저자

  CustomCardItem({
    required this.imageUrl,
    required this.title,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지 표시
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Image.network(
                imageUrl,
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // 패딩 추가
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // 제목 스타일
                ),
                //저자 입력 안 하면 생략
                _author(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _author() {
    if (author == null) {
      return SizedBox.shrink();
    } else {
      return Text(
        author!,
        style: TextStyle(color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis, // 저자 스타일
      );
    }
  }
}
