import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:news_app/widgets/stateful/custom_search.dart';
import '../../config/themes/app_colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.primaryColor,
        child: SafeArea(
            child: Container(
          height: kToolbarHeight,
          child: Row(
            children: [
              IconButton(
                  // ignore: avoid_returning_null_for_void
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  // ignore: prefer_const_constructors
                  icon: ImageIcon(
                      const AssetImage(
                          "assets/images/icons/white-hamburger.png"),
                      color: Colors.white)),
              // ignore: prefer_const_constructors
              Expanded(
                  // ignore: prefer_const_constructors
                  child: ImageIcon(
                const AssetImage("assets/images/icons/app_logo_white.png"),
                color: Colors.white,
              )),
              IconButton(
                  // ignore: avoid_returning_null_for_void
                  onPressed: () =>
                      showSearch(context: context, delegate: CustomSearch()),
                  // ignore: prefer_const_constructors
                  icon: ImageIcon(
                      const AssetImage("assets/images/icons/search.png"),
                      color: Colors.white)),
            ],
          ),
        )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
