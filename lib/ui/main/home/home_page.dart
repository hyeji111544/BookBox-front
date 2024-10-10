import 'package:bookbox/ui/main/home/cate_tab/cate_tab.dart';
import 'package:bookbox/ui/main/home/hit_tab/hit_tab.dart';
import 'package:bookbox/ui/main/home/recommend_tab/recommend_tab.dart';
import 'package:bookbox/ui/main/home/uptodate_tab/uptodate_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("홈페이지 그림");
    return Column(
      children: [
        TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.tab, // 글자 말고 탭 길이 추구
          controller: tabController,
          tabs: [
            Tab(text: '추천'),
            Tab(
              child: Text(
                '최신\n업데이트', // \n로 줄바꿈
                textAlign: TextAlign.center, // 중앙 정렬
              ),
            ),
            Tab(text: '인기'),
            Tab(text: '주제별'),
          ],
        ),
        // Expanded로 TabBarView를 감싸서 화면 전환 지원
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              RecommendTab(),
              UptodateTab(),
              HitTab(),
              CateTab(),
            ],
          ),
        ),
      ],
    );
  }
}