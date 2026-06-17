import 'package:flutter/material.dart';
import '../models/attraction.dart';

// 详情页：展示大图 + 完整中韩双语介绍
// 상세 페이지: 큰 이미지 + 중한 양국어 소개
class DetailScreen extends StatelessWidget {
  final Attraction item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 顶部大图 + 标题 / 상단 큰 이미지 + 제목
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFF1565C0),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 60),
                    ),
                  ),
                  // 渐变遮罩，让标题更清晰 / 그라데이션 오버레이로 제목 가독성 향상
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

          // 正文内容 / 본문 내용
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 分类标签 / 분류 태그
                  Chip(
                    avatar: Icon(
                      item.categoryIcon,
                      size: 18,
                      color: const Color(0xFF1565C0),
                    ),
                    label: Text(item.category),
                    backgroundColor: const Color(0xFFE3F2FD),
                  ),
                  const SizedBox(height: 8),

                  // 副标题简介 / 부제목 소개
                  Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF424242),
                    ),
                  ),
                  const Divider(height: 32),

                  // 详情正文（中韩双语） / 상세 본문（중한 이중 언어）
                  Text(
                    item.detail,
                    style: const TextStyle(fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
