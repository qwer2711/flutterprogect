import 'package:agics_project/app/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:agics_project/app/models/status.dart';
import 'package:agics_project/app/utils/routers.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List favorList = [];

  @override
  void initState() {
    super.initState();
    for (var item in itemListDetail) {
      if (item.isFavor) {
        favorList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: '즐겨찾기',
      currentInx: 1,
      logo: false,
      body: favorList.isEmpty
          ? Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '찜한 상품이 없어요',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Text(
                      '하트를 눌러 마음에 드는 상품을 찜해보세요.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45),
                    ),
                    InkWell(
                      onTap: () {
                        MyRouter.pushNamed(context, MyRouter.homePage);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          '상품보러가기',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 10.0, //  간격 조절
              crossAxisSpacing: 10.0, //  간격 조절
              crossAxisCount: 2,
              children: List.generate(favorList.length, (index) {
                return InkWell(
                  onTap: () {
                    selectedItem.clear();
                    selectedItem = [favorList[index]];
                    MyRouter.pushNamed(context, MyRouter.itemDetailPage);
                  },
                  child: Image(
                    image:
                        AssetImage('assets/images/${favorList[index].image}'),
                    fit: BoxFit.fill,
                  ),
                );
              }),
            ),
    );
  }
}
