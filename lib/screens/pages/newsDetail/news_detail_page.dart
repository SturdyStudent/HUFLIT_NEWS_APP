import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_colors.dart';

import '../../../models/article.dart';
import '../../../widgets/thumbnail/custom_image.dart';
import 'bloc/detail_bloc.dart';
import 'bloc/detail_state.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state == null) {
          return const Center(child: Text('Null bloc'));
        }
        if (state is FailureArticle) {
          return const Center(child: Text('Something went wrong'));
        }
        if (state is LoadedArticle) {
          if (state.selectedArticle == null) {
            return const Text('No content avilable');
          } else {
            return _body(
              context,
              state.selectedArticle,
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    )));
  }

  Widget _body(BuildContext context, Article article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _barNews(context, article),
        ),
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
          child: _noteHeaderNews(context, article),
        ),
        SliverToBoxAdapter(
          child: _titleNews(context, article),
        ),
        SliverToBoxAdapter(
          child: _contentNews(context, article),
        ),
      ],
    );
  }

  Widget _barNews(BuildContext context, Article article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: kToolbarHeight,
          color: AppColors.primaryColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _headerNews(BuildContext context, Article article) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Hero(
            tag: 'headerImage', //child: Text('')
            child: (article.urlToImage == null || article.urlToImage!.isEmpty)
                ? Container()
                : customImage(article.urlToImage),
          ),
          Container(
            width: 356,
            height: 80,
            padding: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noteHeaderNews(BuildContext context, Article article) {
    String nameurl = article.url!.substring(34);
    String removeurl = nameurl.replaceAll(RegExp('[^A-Za-z]'), ' ');

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          color: const Color.fromRGBO(202, 202, 202, 0.612),
          child: Text(
            // removeurl.toUpperCase(),
            "${article.description}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
            ),
          )),
    );
  }

  Widget _titleNews(BuildContext context, Article article) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Text(article == null ? '' : article.title.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: <Widget>[
              Text(
                "${article.getTime()} | ",
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              Text(
                "${article.author}",
                style: const TextStyle(
                    fontSize: 13, color: AppColors.primaryColor),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _contentNews(BuildContext context, Article article) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            "${article.description}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(article.content ?? ''),
        ],
      ),
    );
  }
}
