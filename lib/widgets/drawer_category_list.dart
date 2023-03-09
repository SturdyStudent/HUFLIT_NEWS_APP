// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app/config/themes/app_colors.dart';

// ignore: non_constant_identifier_names
Widget DrawerCategoryList() {
  return Container(
    color: AppColors.darkColor,
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
        menuItem('Thế giới'),
        menuItem('Châu Phi'),
        menuItem('Châu Úc'),
        menuItem('Trung Đông'),
        menuItem('Kinh doanh'),
        menuItem('Công nghệ'),
        menuItem('Khoa học'),
        menuItem('Sức khỏe'),
        menuItem('Giải trí'),
        menuItem('Thể thao'),
      ],
    ),
  );
}

Widget menuItem(String itemName) {
  return Material(
    color: AppColors.darkColor,
    child: InkWell(
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
