List<ItemState> selectedItem = [];
final List cartList = [];

class ItemState {
  ItemState({
    required this.brand,
    required this.name,
    required this.image,
    required this.contents,
    required this.price,
    required this.isFavor,
    required this.cart,
    required this.imageList,
    required this.isChecked,
  });

  final String brand;
  final String name;
  final String image;
  final String contents;
  final int price;
  late bool isFavor;
  late bool cart;
  late bool isChecked;

  List<String> imageList = [];
}

List<ItemState> itemListDetail = [
  ItemState(
    brand: '브랜드1',
    name: '아이템1',
    contents: '여기는 아이템1 디테일페이지입니다.',
    image: 'item_1.jpg',
    price: 27000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_1.jpg',
      'assets/images/item_2.jpg',
      'assets/images/item_3.jpg',
      'assets/images/item_4.jpg',
      'assets/images/item_5.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드2',
    name: '아이템2',
    image: 'item_2.jpg',
    contents: '여기는 아이템2 디테일페이지입니다.',
    price: 17000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_2.jpg',
      'assets/images/item_3.jpg',
      'assets/images/item_8.jpg',
      'assets/images/item_9.jpg',
      'assets/images/item_10.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드3',
    name: '아이템3',
    image: 'item_3.jpg',
    contents: '여기는 아이템3 디테일페이지입니다.',
    price: 30000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_3.jpg',
      'assets/images/item_1.jpg',
      'assets/images/item_4.jpg',
      'assets/images/item_7.jpg',
      'assets/images/item_9.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드4',
    name: '아이템4',
    image: 'item_4.jpg',
    contents: '여기는 아이템4 디테일페이지입니다.',
    price: 40000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_4.jpg',
      'assets/images/item_5.jpg',
      'assets/images/item_7.jpg',
      'assets/images/item_9.jpg',
      'assets/images/item_1.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드5',
    name: '아이템5',
    image: 'item_5.jpg',
    contents: '여기는 아이템5 디테일페이지입니다.',
    price: 27000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_5.jpg',
      'assets/images/item_4.jpg',
      'assets/images/item_6.jpg',
      'assets/images/item_8.jpg',
      'assets/images/item_10.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드6',
    name: '아이템6',
    image: 'item_6.jpg',
    contents: '여기는 아이템6 디테일페이지입니다.',
    price: 50000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_6.jpg',
      'assets/images/item_8.jpg',
      'assets/images/item_10.jpg',
      'assets/images/item_2.jpg',
      'assets/images/item_4.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드7',
    name: '아이템7',
    image: 'item_7.jpg',
    contents: '여기는 아이템7 디테일페이지입니다.',
    price: 40000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_7.jpg',
      'assets/images/item_8.jpg',
      'assets/images/item_9.jpg',
      'assets/images/item_10.jpg',
      'assets/images/item_1.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드8',
    name: '아이템8',
    image: 'item_8.jpg',
    contents: '여기는 아이템8 디테일페이지입니다.',
    price: 20000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_8.jpg',
      'assets/images/item_9.jpg',
      'assets/images/item_10.jpg',
      'assets/images/item_2.jpg',
      'assets/images/item_3.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드9',
    name: '아이템9',
    image: 'item_9.jpg',
    contents: '여기는 아이템9 디테일페이지입니다.',
    price: 10000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_9.jpg',
      'assets/images/item_10.jpg',
      'assets/images/item_1.jpg',
      'assets/images/item_2.jpg',
      'assets/images/item_3.jpg',
    ],
  ),
  ItemState(
    brand: '브랜드10',
    name: '아이템10',
    image: 'item_10.jpg',
    contents: '여기는 아이템10 디테일페이지입니다.',
    price: 100000,
    isFavor: false,
    cart: false,
    isChecked: false,
    imageList: [
      'assets/images/item_10.jpg',
      'assets/images/item_4.jpg',
      'assets/images/item_5.jpg',
      'assets/images/item_6.jpg',
      'assets/images/item_8 .jpg',
    ],
  ),
];
// List<Map<String, dynamic>> itemList = [
//   {'title': 'box1', 'image': 'item_1.jpg'},
//   {
//     'title': 'box2',
//     'color': Colors.black,
//   },
//   {
//     'title': 'box3',
//     'color': Colors.blue,
//   },
//   {
//     'title': 'box4',
//     'color': Colors.pink,
//   },
//   {
//     'title': 'box5',
//     'color': Colors.green,
//   },
//   {
//     'title': 'box6',
//     'color': Colors.orange,
//   },
//   {
//     'title': 'box7',
//     'color': Colors.purple,
//   },
//   {
//     'title': 'box8',
//     'color': Colors.yellow,
//   },
//   {
//     'title': 'box9',
//     'color': Colors.cyan,
//   },
//   {
//     'title': 'box10',
//     'color': Colors.orangeAccent,
//   },
// ];
