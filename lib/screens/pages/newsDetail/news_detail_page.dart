import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/article.dart';
import '../../../widgets/thumbnail/custom_image.dart';
import 'bloc/detail_bloc.dart';
import 'bloc/detail_state.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  Widget _headerNews(BuildContext context, Article article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(tag: 'headerImage', child: Text('')
            // (article.urlToImage == null || article.urlToImage!.isEmpty)
            //     ? Container()
            //     : customImage(article.urlToImage),
            ),
        Container(
          padding: EdgeInsets.only(left: 0, right: 10, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).backgroundColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _body(BuildContext context, Article article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(article == null ? '' : article.title.toString()),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(article.author ?? ''),
                  SizedBox(
                    width: 10,
                  ),
                  Text(article.getTime()),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Text(article.content ?? '')
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state == null) {
          return Center(child: Text('Null bloc'));
        }
        if (state is FailureArticle) {
          return Center(child: Text('Something went wrong'));
        }
        if (state is LoadedArticle) {
          if (state.selectedArticle == null) {
            return Text('No content avilable');
          } else {
            return _body(
              context,
              state.selectedArticle,
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    )));
  }
}
