import 'package:flutter/material.dart';
import 'package:notices_app/src/pages/pages.dart';
import 'package:notices_app/src/services/news_service.dart';
import 'package:notices_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const NoticeApp());

class NoticeApp extends StatelessWidget {
  const NoticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: themeNotice,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
