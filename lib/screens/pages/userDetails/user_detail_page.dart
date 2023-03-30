import 'package:flutter/material.dart';
import 'package:news_app/screens/pages/homePage/home_page.dart';
import 'package:news_app/widgets/auth_widget/change_password.dart';
import 'package:news_app/config/themes/app_text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBB0712),
        title: const Text('User Profile'),
        elevation: 0,
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: AssetImage('assets/images/profile.jpg'),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Violet is blue',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  'lisaViolet@gmail.com',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              const SizedBox(height: 60),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Icon(Icons.account_circle),
                  const Text('Username: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text('violet',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(height: 25),
              Row(children: [
                const Icon(Icons.calculate_rounded),
                const Text('Age: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('25',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Icon(Icons.people_outlined),
                const Text('Gender:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Nữ',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Icon(Icons.phone),
                const Text('Phone Number: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('0931213223',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Icon(Icons.add_location),
                const Text('Country: ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Viet Nam',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              const Divider(
                thickness: 2,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword()),
                    );
                  },
                  child: Text(
                    'Đổi mật khẩu',
                    style: AppTextStyle.h4.copyWith(color: Color(0xFFBB0712)),
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Text(
                    'Đăng xuất',
                    style: AppTextStyle.h4.copyWith(color: Color(0xFFBB0712)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
