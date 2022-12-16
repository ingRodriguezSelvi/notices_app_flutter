import 'package:flutter/material.dart';
import 'package:notices_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class TabOnePage extends StatefulWidget {
  const TabOnePage({Key? key}) : super(key: key);

  @override
  State<TabOnePage> createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    newsService.getTopHeadlines();
    return Scaffold(
      body: (newsService.headlines.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : ListNews(newsService.headlines));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
