import 'package:agics_project/app/models/status.dart';
import 'package:flutter/material.dart';
import 'package:agics_project/app/layout/layout.dart';
import 'package:agics_project/app/utils/routers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      logo: true,
      title: '홈',
      currentInx: 0,
      body: GridView.count(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 10.0, //  간격 조절
        crossAxisSpacing: 10.0, //  간격 조절
        crossAxisCount: 2,
        children: List.generate(
          itemListDetail.length,
          (index) => InkWell(
            onTap: () {
              selectedItem.clear();
              selectedItem = [itemListDetail[index]];
              MyRouter.pushNamed(context, MyRouter.itemDetailPage);
            },
            child: Image(
              image: AssetImage('assets/images/${itemListDetail[index].image}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.widget,
  });

  final Layout widget;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.pink.withOpacity(0.5),
        // currentIndex는 null이 아님을 확신
        currentIndex: widget.currentInx!,
        onTap: (index) {
          debugPrint('===> ${widget.currentInx}');
          // 같은 페이지메뉴 클릭시 중복이동(뒤로가기 많아짐) 방지
          if (widget.currentInx == index) return;
          switch (index) {
            case 0:
              MyRouter.pushNamed(context, MyRouter.homePage);
              break;
            case 1:
              MyRouter.pushNamed(context, MyRouter.favoritePage);
              break;
            case 2:
              MyRouter.pushNamed(context, MyRouter.userPage);
              break;
            case 3:
              MyRouter.pushNamed(context, MyRouter.settingPage);
              break;
            default:
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'user'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ]);
  }
}
