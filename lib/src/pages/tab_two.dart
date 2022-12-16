import 'package:flutter/material.dart';
import 'package:notices_app/src/models/category_model.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../theme/theme.dart';
import '../widgets/widgets.dart';

class TabTwoPage extends StatelessWidget {
  const TabTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    newsService.getArticlesByCategory('business');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:   [
            const Expanded(child: _ListCategorys()),
            Expanded(child: ListNews(newsService.getArticulesCategoriesSelected)),
          ],
        ),
      ),
    );
  }
}

class _ListCategorys extends StatelessWidget {
  const _ListCategorys({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
            final categoryName = categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryBotton(category: categories[index]),
                  const SizedBox(height: 5),
                  Text(categories[index].name, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  final Category category;
  const _CategoryBotton({
    Key? key, required this.category
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: (){
        newsService.setSelectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(category.icon, color:newsService.getSelectedCategory == category.name ? Colors.red : Colors.black54),
      ),
    );
  }
}
