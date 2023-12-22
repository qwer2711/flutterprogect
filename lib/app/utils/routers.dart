import 'package:agics_project/app/screen/custom/item_detail_page.dart';
import 'package:agics_project/app/screen/custom/cart_list_page.dart';
import 'package:flutter/material.dart';
import 'package:agics_project/app/screen/home/home_page.dart';
import 'package:agics_project/app/screen/home/favorite_page.dart';
import 'package:agics_project/app/screen/home/setting_page.dart';
import 'package:agics_project/app/screen/home/user_page.dart';

class MyRouter {
  static String homePage = 'home://home_page',
      favoritePage = 'home://favorite_page',
      settingPage = 'home://setting_page',
      userPage = 'home://user_page',
      itemDetailPage = 'custom://item_detail_page',
      cartListPage = 'custom://cart_list_page';

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    // 1. home_page router
    homePage: (BuildContext context) => const HomePage(),
    // 2. favorite_page router
    favoritePage: (BuildContext context) => const FavoritePage(),
    // 3. setting_page router
    settingPage: (BuildContext context) => const SettingPage(),
    // 4. user_page router
    userPage: (BuildContext context) => const UserPage(),
    // 5. item_detail_page router
    itemDetailPage: (BuildContext context) => const ItemDetailPage(),
    cartListPage: (BuildContext context) => const CartListPage(),
  };

  MyRouter.pushNamed(BuildContext context, String url) {
    Navigator.of(context).pushNamed(url);
  }
}
