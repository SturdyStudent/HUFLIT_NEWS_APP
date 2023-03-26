import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/widgets/thumbnail/custom_image.dart';

import '../../../models/article.dart';
import '../newsDetail/bloc/bloc.dart';
import 'bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is Failure) {
              return const Center(child: Text('Something went wrong'));
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
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              bottom: 10,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tin tức Việt Nam", style: AppTextStyle.h0.copyWith()),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Tin tức nóng nhất được cập nhật mỗi ngày",
                  style: AppTextStyle.h5.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                _headerNews(list?.first),
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
      ),
    ],
  );
}

Widget gridNews(List<Article> articles) {
  return GridView.count(
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
  );
}

Widget newsItem(Article article) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(alignment: Alignment.topRight, children: <Widget>[
        Container(
            padding: const EdgeInsets.only(top: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                article.urlToImage ?? '',
                fit: BoxFit.cover,
                height: 100,
                width: 150,
              ),
            )),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
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
        article.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _headerNews(Article? article) {
  return Builder(
    builder: (context) {
      return InkWell(
          onTap: () {
            final detailBloc = BlocProvider.of<DetailBloc>(context);
            if (article != null) {
              detailBloc.add(SelectNewsForDetail(article: article));
            }
            Navigator.pushNamed(context, '/detail');
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Hero(
                  tag: 'headerImage',
                  child: article?.urlToImage == null
                      ? Container()
                      : customImage(article?.urlToImage),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, bottom: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article == null ? '' : article.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.white)),
                    Text(article == null ? '' : article.getTime().toString(),
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white))
                  ],
                ),
              ),
              const Positioned(
                  top: 0,
                  right: -7,
                  child: Image(
                    width: 50,
                    height: 55,
                    image: AssetImage('assets/images/icons/bookmark_plus.png'),
                    fit: BoxFit.fill,
                  )),
            ],
          ));
    },
  );
}
