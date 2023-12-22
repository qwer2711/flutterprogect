import 'package:agics_project/app/screen/custom/item_detail_page.dart';
import 'package:agics_project/app/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:agics_project/app/utils/routers.dart';
import 'package:agics_project/app/models/status.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
    this.title,
    this.body,
    this.currentInx,
    this.bottomMenu,
    this.logo,
  });

  // 페이지 이름
  final String? title;
  // 메뉴페이지
  final Widget? body;
  // 하단메뉴와 body 연결
  final int? currentInx;
  final String? bottomMenu;
  final bool? logo;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.logo == false
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  MyRouter.pushNamed(context, MyRouter.homePage);
                },
              )
            : null,
        // AppBar 로고넣기
        title: widget.logo! == true
            ? Image.asset('assets/images/logo.png', fit: BoxFit.cover)
            : const SizedBox.shrink(),
        // AppBar 컬러 ,
        backgroundColor: Colors.pink.withOpacity(0.3),
        automaticallyImplyLeading: false,
        // AppBar 우측 버튼
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    MyRouter.pushNamed(context, MyRouter.cartListPage);
                  },
                  icon: const Icon(Icons.shopping_basket)),
              Positioned(
                top: 8,
                right: 6,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.pink,
                  child: Text(
                    cartList.length.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // body내용
      body: widget.body,
      // 하단 메뉴바 bottomNavigationBar
      bottomNavigationBar: widget.currentInx == null
          ? widget.bottomMenu == 'none'
              ? null
              : const BuyBottomNav()
          : HomeBottomNav(widget: widget),
    );
  }
}
