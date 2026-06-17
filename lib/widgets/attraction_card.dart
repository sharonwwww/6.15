import 'package:flutter/material.dart';
import '../models/attraction.dart';
import '../screens/detail_screen.dart';

// 列表卡片：图片 + 标题 + 简介，点击跳转详情页
// 목록 카드: 이미지 + 제목 + 소개, 클릭시 상세 페이지로 이동
class AttractionCard extends StatelessWidget {
  final Attraction item;

  const AttractionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // 点击卡片，跳转到详情页 / 카드를 클릭하면 상세 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
          );
        },
        child: Row(
          children: [
            // 左侧图片 / 좌측 이미지
            SizedBox(
              width: 110,
              height: 110,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            // 右侧文字信息 / 우측 텍스트 정보
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          item.categoryIcon,
                          size: 16,
                          color: const Color(0xFF1565C0),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.category,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1565C0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Colors.grey),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
