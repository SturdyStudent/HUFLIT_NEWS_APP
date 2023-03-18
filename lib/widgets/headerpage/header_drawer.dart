import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/themes/app_colors.dart';
import 'package:news_app/config/themes/app_text_style.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_bloc.dart';
import 'package:news_app/screens/pages/userAuthPage/bloc/auth_state.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryColor,
        width: double.infinity,
        height: 180,
        padding: const EdgeInsets.only(top: 20.0, left: 15.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage((state is LogInSuccess)
                                  ? "assets/images/profile.jpg"
                                  : 'assets/images/icons/user.png'))),
                    )),
                if (state is LogInSuccess) ...[
                  const Text("Violet Is Blue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  const Text(
                    "lisaViolet@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ] else ...[
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Đăng nhập',
                            style:
                                AppTextStyle.h4.copyWith(color: Colors.white),
                          )),
                      Text('/',
                          style: AppTextStyle.h4.copyWith(color: Colors.white)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Đăng kí',
                            style:
                                AppTextStyle.h4.copyWith(color: Colors.white),
                          ))
                    ],
                  )
                ]
              ],
            );
          },
        ));
  }
}
