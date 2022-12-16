import 'package:flutter/material.dart';
import 'package:notices_app/src/pages/tab_one_page.dart';
import 'package:notices_app/src/pages/tab_two.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegationModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

///Button Navigation Bar
class _Navegation extends StatelessWidget {
  const _Navegation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavegationModel>(context);
    final newsService = Provider.of<NewsService>(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navegationModel.currentPage,
          onTap: (index) => navegationModel.currentPage = index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'For You'),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Top World'),
          ],
        ),
      ),
    );
  }
}

////PAGES
class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);
    return PageView(controller: navegationModel.pageController,physics: const NeverScrollableScrollPhysics(), children: const [
      TabOnePage(),
      TabTwoPage(),
    ]);
  }
}

class _NavegationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(_currentPage,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
