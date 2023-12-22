import 'package:flutter/material.dart';
import 'package:agics_project/app/utils/routers.dart';
import 'package:agics_project/app/layout/layout.dart';
import 'package:agics_project/app/models/status.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:intl/intl.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

CarouselController controller = CarouselController();

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentIndex = 0;
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    // 상세페이지 레이아웃
    return Layout(
      logo: false,
      body: Column(
        children: [
          Stack(children: [
            CarouselSlider(
              items: selectedItem[0].imageList.map((item) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    scale: 1,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 1 / 1, // 슬라이더의 가로 세로 비율
                enlargeCenterPage: false, // 현재 페이지를 확대하여 표시
                autoPlay: true, // 자동 슬라이드 기능 사용
                autoPlayInterval: const Duration(seconds: 5), // 슬라이드 간의 시간 간격
                enableInfiniteScroll: true, // 무한 스크롤 사용
                viewportFraction: 1, // 슬라이더 크기 비율
                onPageChanged: (item, _) {
                  setState(() {
                    _currentIndex = item;
                  });
                },
                // autoPlayAnimationDuration:
                //     Duration(milliseconds: 800), // 슬라이드 애니메이션 소요 시간
                // autoPlayCurve: Curves.fastOutSlowIn, // 슬라이드 애니메이션 커브
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: DotsIndicator(
                  dotsCount: selectedItem[0].imageList.length,
                  position: _currentIndex,
                  decorator: DotsDecorator(
                    color: Colors.black12, // Inactive color
                    activeColor: Colors.pink.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ]),
          Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedItem[0].brand,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.share_outlined),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedItem[0].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(selectedItem[0].contents),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '30%',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '${f.format(selectedItem[0].price)}원',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '${f.format(selectedItem[0].price + selectedItem[0].price * 0.3)}원',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BuyBottomNav extends StatefulWidget {
  const BuyBottomNav({
    super.key,
  });

  @override
  State<BuyBottomNav> createState() => _BuyBottomNavState();
}

class _BuyBottomNavState extends State<BuyBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.black26),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // StatefulWidget 사용해준다.
                setState(() {
                  selectedItem[0].isFavor = !selectedItem[0].isFavor;
                });
              },
              icon: Icon(
                selectedItem[0].isFavor
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_outlined,
                size: 20,
                color: Colors.black54,
              ),
            ),
            InkWell(
              onTap: () {
                addCart(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 1,
                        color:
                            selectedItem[0].cart ? Colors.pink : Colors.black26,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      children: [
                        selectedItem[0].cart
                            ? const Icon(
                                Icons.shopping_basket,
                                color: Colors.pink,
                              )
                            : const Icon(
                                Icons.shopping_basket_outlined,
                                color: Colors.black26,
                              ),
                        const SizedBox(width: 10),
                        Text(
                          '장바구니',
                          style: TextStyle(
                              color: selectedItem[0].cart
                                  ? Colors.pink
                                  : Colors.black26,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: const Text(
                  '구매하기',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ), //REPLACE WITH ICON
          ],
        ),
      ),
    );
  }
}

void addCart(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 200,
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('해당상품을 장바구니에'), Text('추가하시겠습니까?')],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        if (selectedItem[0].cart) {
                          complete(context, '이미 장바구니에 담았어요.');
                        } else {
                          selectedItem[0].cart = true;

                          cartList.add(selectedItem[0]);
                          complete(context, '장바구니에 상품을 담았어요.');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: const Text(
                          '확인',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: const Text(
                          '취소',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ), //REPLAC
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void complete(BuildContext context, String coment) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 200,
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(coment),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        MyRouter.pushNamed(context, MyRouter.itemDetailPage);
                        // Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: const Text(
                          '확인',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
