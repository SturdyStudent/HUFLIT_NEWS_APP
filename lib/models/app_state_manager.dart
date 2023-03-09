import 'dart:async';

import 'package:flutter/material.dart';

class NewsTab {
  //tạo constant cho mỗi tab người dùng nhấn
  static const int topStory = 0;
  static const int explore = 1;
  static const int videos = 2;
  static const int saved = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false; //kiểm tra xem app đã khởi tạo chưa
  bool _loggedIn = false; // Kiểm tra xem người dùng đã login chưa
  int _selectedTab = NewsTab.topStory; //theo dõi người dùng đang ở tab nào

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  int get getSelectedTab => _selectedTab;

  // final _appCache = AppCache();

  Future<void> initializeApp() async {
    // Check if the user is logged in
    // _loggedIn = await _appCache.isUserLoggedIn();
    //   // Check if the user completed onboarding
    // _onboardingComplete = await _appCache.didCompleteOnboarding();
    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  void login(String username, String password) async {
    _loggedIn = true;
    // await _appCache.cacheUser();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void Logout() {
    _loggedIn = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
