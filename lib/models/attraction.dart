import 'package:flutter/material.dart';

// 呼和浩特家乡介绍数据模型 / 호호트 고향 소개 데이터 모델
// 用于展示景点、美食、推荐路线等内容卡片
class Attraction {
  final String title; // 标题 / 제목
  final String subtitle; // 列表页副标题（一句话简介） / 목록 부제목（한 줄 소개）
  final String imageUrl; // 图片地址（网络图片） / 이미지 주소（네트워크 이미지）
  final String detail; // 详情页正文介绍 / 상세 본문 소개
  final String category; // 分类标签：景点 / 美食 / 路线 / 분류 태그: 景点/美食/路线
  final IconData categoryIcon; // 分类图标 / 분류 아이콘

  const Attraction({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.detail,
    required this.category,
    required this.categoryIcon,
  });
}
