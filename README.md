# 呼和浩特家乡介绍 App / 후허하오터 고향 소개 앱

基于 Flutter 开发的家乡介绍应用，符合期末项目"个人家乡页面"要求。

## 功能特点 / 기능 특징

- 首页展示呼和浩特整体介绍（封面图 + 地区简介，中韩双语）
- 分类筛选：全部 / 景点 / 美食 / 路线
- 列表卡片显示图片缩略图 + 标题 + 简介
- **点击列表项可跳转详情页**，展示大图 + 完整中韩双语介绍
- 包含内容：
  - 代表景点：内蒙古博物院、大召寺、希拉穆仁草原、昭君博物院
  - 代表美食：手抓羊肉、蒙古奶茶配奶豆腐、羊肉烧麦
  - 推荐旅行路线：市区文化一日游、草原体验一日游

## 项目结构 / 프로젝트 구조

```
hohhot_app/
├── lib/
│   ├── main.dart                 # 应用入口
│   ├── models/
│   │   └── attraction.dart       # 数据模型
│   ├── data/
│   │   └── hohhot_data.dart      # 呼和浩特介绍数据（图文内容）
│   ├── screens/
│   │   ├── home_screen.dart      # 首页（列表）
│   │   └── detail_screen.dart    # 详情页
│   └── widgets/
│       └── attraction_card.dart  # 列表卡片组件
├── pubspec.yaml                  # 项目配置
└── README.md
```

## 运行方法 / 실행 방법

```bash
flutter pub get
flutter run
```

## 自定义图片说明 / 이미지 커스터마이징

当前图片使用网络图片（Unsplash），需要联网才能正常显示。
如果要换成本地图片资源（更稳定，无需联网）：

1. 在 `assets/images/` 目录放入图片（如 `dazhao_temple.jpg`）
2. 在 `pubspec.yaml` 中添加：
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```
3. 在 `lib/data/hohhot_data.dart` 中将 `imageUrl` 替换为本地路径：
   ```dart
   imageUrl: 'assets/images/dazhao_temple.jpg',
   ```
4. 在 `widgets/attraction_card.dart` 和 `screens/detail_screen.dart` 中将
   `Image.network(...)` 改为 `Image.asset(...)`

## 后续可扩展方向 / 추가 확장 방향

- 增加搜索功能
- 增加收藏/书签功能
- 接入 AI 功能（如根据兴趣推荐景点，对应"AI 활용 내용"要求）
- 接入地图定位显示景点位置（LBS）
