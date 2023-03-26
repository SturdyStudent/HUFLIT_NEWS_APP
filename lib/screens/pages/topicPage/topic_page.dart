import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/widgets/thumbnail/custom_image.dart';

import '../../../models/article.dart';
import '../homePage/bloc/news_bloc.dart';
import '../homePage/bloc/news_state.dart';
import '../newsDetail/bloc/bloc.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state == null) {
              return Center(child: Text('Null block'));
            }
            if (state is Failure) {
              return Center(child: Text('Something went wrong'));
            }
            if (state is Loaded) {
              // ignore: unnecessary_null_comparison
              if (state.items == null) {
                return const Text('No content avilable');
              } else {
                return _body(context, state.items, type: state.type);
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Widget _body(
  BuildContext context,
  List<Article> list, {
  required String type,
}) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              _headerTopic(context, list.first),
              const SizedBox(
                height: 27,
              ),
              gridNews(
                list,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget gridNews(List<Article> articles) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: GridView.count(
      physics: const ScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 1.0,
      shrinkWrap: true,
      children: articles.map(
        (article) {
          return newsItem(article);
        },
      ).toList()
        ..removeAt(0),
    ),
  );
}

Widget newsItem(Article? article) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(alignment: Alignment.topRight, children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            article?.urlToImage ?? '',
            fit: BoxFit.cover,
            height: 100,
            width: 150,
          ),
        ),
        const Positioned(
            top: -5,
            right: -7,
            child: Image(
              width: 40,
              height: 45,
              image: AssetImage('assets/images/icons/bookmark_plus.png'),
              fit: BoxFit.fill,
            )),
      ]),
      Text(
        article?.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _headerTopic(BuildContext context, Article article) {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      Container(
        color: AppColors.mainRed,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
            Text(
              'Công nghệ',
              style: AppTextStyle.h3
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                child: const Text('')),
          ],
        ),
      )
    ],
  );
}
