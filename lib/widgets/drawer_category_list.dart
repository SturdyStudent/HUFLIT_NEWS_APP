// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';

// ignore: non_constant_identifier_names
Widget DrawerCategoryList(BuildContext context) {
  List<String> categoryList = [
    'Thế giới',
    'Châu Phi',
    'Châu Úc',
    'Trung Đông',
    'Kinh doanh',
    'Công nghệ',
    'Khoa học',
    'Sức khỏe',
    'Giải trí',
    'Thể thao',
  ];

  double height = MediaQuery.of(context).size.height;

  return Container(
    color: AppColors.darkColor,
    height: height - 180,
    child: Column(
      children: [
        Container(
          color: AppColors.normalBlack,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: const Text(
            "DANH SÁCH CHỦ ĐỀ",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return menuItem(categoryList[index], context);
            })
      ],
    ),
  );
}

Widget menuItem(String itemName, BuildContext context) {
  return Material(
    color: AppColors.darkColor,
    child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/topic');
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            // ignore: prefer_const_constructors
            child: Text(
              itemName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )),
  );
}
