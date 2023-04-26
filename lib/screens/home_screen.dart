// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/screens/explore_screen.dart';
import 'package:news_app/screens/pages/homePage/home_page.dart';
import 'package:news_app/screens/pages/videoNews/videos_page.dart';
import 'package:news_app/widgets/drawer_category_list.dart';
import 'package:news_app/widgets/headerpage/header_drawer.dart';
import 'package:news_app/widgets/headerpage/header.dart';

import 'pages/savedPage/saved_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final tabs = [
    const HomePage(),
    const ExploreScreen(),
    const VideoPage(),
    const SavedPage()
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      key: _globalKey,
      appBar: const Header(),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: AppColors.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/feed.png")),
            label: "Tin mới",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/explore.png")),
            label: "Khám phá",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/videos.png")),
            label: "Videos",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/icons/bookmark.png")),
            label: "Lưu trữ",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        backgroundColor: AppColors.darkColor,
        child: SingleChildScrollView(
          child: Column(
            children: [const HeaderDrawer(), DrawerCategoryList(context)],
          ),
        ),
      ),
    );
  }
}
