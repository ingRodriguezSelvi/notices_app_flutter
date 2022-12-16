import 'package:flutter/material.dart';
import 'package:notices_app/src/models/news_models.dart';

import '../theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews( this.news, {super.key} );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: news.length,itemBuilder:(BuildContext context,int index){
      return _News(article: news[index], index: index);
    });
  }
}

class _News extends StatelessWidget {
  final Article article;
  final int index;
  const _News({Key? key, required this.article, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(article, index),
        _CardTitle(article),
        _CardImage(article),
        _CardBody(article),
        _CardButtons(),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;
  const _CardTopBar(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text('${article.source!.name}. ', style: TextStyle(color: themeNotice.accentColor)),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;
  const _CardTitle(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title ?? '',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;
  const _CardImage(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(article.urlToImage!),
                )
              : const Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Article article;
  const _CardBody(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text((article.description != null) ? article.description! : ''),
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _CardButton(text: 'Read more', icon: Icons.more, onPressed: () {}),
          const SizedBox(width: 10),
          _CardButton(text: 'Share', icon: Icons.share, onPressed: () {}),
        ],
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const _CardButton({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:[
          const SizedBox(width: 20,),
          RawMaterialButton(
              onPressed: (){},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              fillColor: Colors.white,
              child: Icon(icon, color: Colors.blue)),
        ]
      )
    );
  }
}

