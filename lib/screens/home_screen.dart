import 'package:flutter/material.dart';
import '../data/hohhot_data.dart';
import '../widgets/attraction_card.dart';

// 首页：呼和浩特家乡介绍主页面
// 홈 화면: 후허하오터 고향 소개 메인 페이지
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 当前选中的分类筛选 / 현재 선택된 분류 필터
  String _selectedCategory = '全部';

  final List<String> _categories = ['全部', '景点', '美食', '路线'];

  @override
  Widget build(BuildContext context) {
    // 根据筛选条件过滤数据 / 필터 조건에 따라 데이터 필터링
    final items = _selectedCategory == '全部'
        ? HohhotData.all
        : HohhotData.all
            .where((e) => e.category == _selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          // 顶部封面区域 / 상단 커버 영역
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: const Color(0xFF1565C0),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '呼和浩特 Hohhot',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    HohhotData.coverImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1565C0),
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 地区简介卡片 / 지역 소개 카드
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_city, color: Color(0xFF1565C0)),
                          SizedBox(width: 8),
                          Text(
                            '家乡地区介绍 / 고향 지역 소개',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        HohhotData.regionIntro,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        HohhotData.regionIntroKo,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 分类筛选标签 / 분류 필터 탭
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  final selected = cat == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: selected,
                      selectedColor: const Color(0xFF1565C0),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (_) {
                        setState(() => _selectedCategory = cat);
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 8)),

          // 内容列表 / 콘텐츠 목록
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AttractionCard(item: items[index]),
              childCount: items.length,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
