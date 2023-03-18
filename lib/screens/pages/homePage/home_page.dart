import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/widgets/thumbnail/custom_image.dart';

import '../../../models/article.dart';
import '../newsDetail/bloc/bloc.dart';
import 'bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
  List<Article>? list, {
  required String type,
}) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverToBoxAdapter(
        child: _headerNews(list?.first),
      ),
      // SliverList(
      //     delegate: SliverChildBuilderDelegate[]
      // (context, index) => NewsCard(
      //       artical: list[index],
      //       type: type.toUpperCase(),
      //     ),
      // childCount: list.length))
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
              Hero(
                tag: 'headerImage',
                child: article?.urlToImage == null
                    ? Container()
                    : customImage(article?.urlToImage),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, bottom: 20, top: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                    // stops: [.1, .9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article == null ? '' : article.title.toString(),
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    Text(article == null ? '' : article.getTime().toString(),
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.white))
                  ],
                ),
              )
            ],
          ));
    },
  );
}
