import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/screens/pages/explorePages/article_preview_page.dart';
import 'package:news_app/screens/pages/explorePages/bloc/bloc.dart';
import 'package:news_app/screens/pages/explorePages/time_select_page.dart';
import 'package:swipe_deck/swipe_deck.dart';

class TopicSelect extends StatefulWidget {
  const TopicSelect({super.key});

  @override
  State<TopicSelect> createState() => _TopicSelectState();
}

class _TopicSelectState extends State<TopicSelect> {
  // ignore: constant_identifier_names


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state is SelectTopicState) {
          return SelectTopic(context);
        } else if (state is SelectTimeState) {
          return const SelectTime();
        } else if (state is PreviewArticleState) {
          return ArticlePreview();
        }
        return SelectTopic(context);
      },
    ));
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {Key? key,
      required this.allowNext,
      this.topPadding = 0,
      required this.child,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final Widget child;
  final double topPadding;
  final String title;
  final bool allowNext;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 30),
        color: AppColors.blackColor,
        child: Column(children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 80, maxWidth: 250),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.h3.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: child,
            ),
          ),
          if (allowNext == true) ...[
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                  onPressed: () {
                    onPressed();
                  },
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.black,
                    size: 50,
                  )),
            )
          ] else ...[
            ElevatedButton(
                onPressed: () {
                  onPressed();
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(AppColors.mainRed),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(10))),
                child: const Text('Bắt đầu đọc'))
          ],
          const SizedBox(height: 30)
        ]));
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile(
      {Key? key, required this.index, required this.width, required this.text})
      : super(key: key);

  final int index;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.mainRed),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.h1
              .copyWith(color: Colors.white, fontSize: width / 20),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount, this.text);
  final int crossAxisCount;
  final int mainAxisCount;
  final String text;
}

Widget SelectTopic(BuildContext context) {
  const tiles = [
    GridTile(5, 4, 'Thế giới'),
    GridTile(3, 3, 'Thể thao'),
    GridTile(5, 3, 'Châu Úc'),
    GridTile(2, 3, 'Trung Đông'),
    GridTile(3, 3, 'Việt Nam'),
    GridTile(4, 4, 'Kinh doanh'),
    GridTile(5, 5, 'Công nghệ'),
    GridTile(3, 3, 'Khoa học'),
    GridTile(6, 6, 'Sức khỏe'),
    GridTile(4, 4, 'Giải trí'),
  ];

  int index = 0;

  return AppScaffold(
    allowNext: true,
    onPressed: () {
      BlocProvider.of<ExploreBloc>(context).add(const NavigateSelectTime());
    },
    title: 'Hôm nay bạn muốn đọc về chủ đề gì?',
    topPadding: 20,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StaggeredGrid.count(
        crossAxisCount: 10,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ...tiles.map((tile) {
            index = index + 1;
            return StaggeredGridTile.count(
              crossAxisCellCount: tile.crossAxisCount,
              mainAxisCellCount: tile.mainAxisCount,
              child: ImageTile(
                  index: index,
                  width: (tile.crossAxisCount < tile.mainAxisCount
                          ? tile.crossAxisCount
                          : tile.mainAxisCount) *
                      100,
                  text: tile.text),
            );
          }),
        ],
      ),
    ),
  );
}
