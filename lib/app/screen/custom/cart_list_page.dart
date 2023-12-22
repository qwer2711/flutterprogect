import 'package:flutter/material.dart';
import 'package:agics_project/app/utils/routers.dart';
import 'package:agics_project/app/layout/layout.dart';
import 'package:agics_project/app/models/status.dart';

class CartListPage extends StatefulWidget {
  const CartListPage({super.key});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  @override
  void initState() {
    super.initState();
    for (var item in itemListDetail) {
      item.isChecked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      logo: false,
      title: '장바구니',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        for (var item in itemListDetail) {
                          item.isChecked = !item.isChecked;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: const Text(
                        '전체선택',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        for (var item in itemListDetail) {
                          if (item.isChecked) {
                            item.cart = false;
                            cartList.remove(item);
                          }
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: const Text(
                        '상품삭제',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            cartList.isEmpty
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
                            '장바구니에 담긴 상품이 없어요',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const Text(
                            '원하는 상품을 담아보세요',
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      mainAxisSpacing: 10.0, //  간격 조절
                      crossAxisSpacing: 10.0, //  간격 조절
                      crossAxisCount: 2,
                      children: List.generate(cartList.length, (index) {
                        return InkWell(
                          onTap: () {
                            selectedItem.clear();
                            selectedItem = [cartList[index]];
                            MyRouter.pushNamed(
                                context, MyRouter.itemDetailPage);
                          },
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/${cartList[index].image}'),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: -6,
                                left: -6,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: Checkbox(
                                    fillColor: cartList[index].isChecked
                                        ? const MaterialStatePropertyAll(
                                            Colors.pink)
                                        : const MaterialStatePropertyAll(
                                            Colors.transparent),
                                    value: cartList[index].isChecked,
                                    side: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        cartList[index].isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
          ],
        ),
      ),
      bottomMenu: 'none',
    );
  }
}
