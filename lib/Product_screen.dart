import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_app/cart_screen.dart';
import 'package:furniture_app/utils/cartlist.dart';
import 'package:furniture_app/widgets/list_items.dart';

import 'model/category_model.dart';

class Productscreen extends StatefulWidget {
  final CategoryModel model;

  Productscreen(this.model);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class Model {
  Map<String, List<String>> differentImagesUrl;

  Model({required this.differentImagesUrl});
}

class _ProductscreenState extends State<Productscreen> {
  List images = [], similarImages = [];
  List colorList = [0xff304B82, 0xffBB4747, 0xffF8C184, 0xff5ABE65];
  int selectedImageIndex = 0,
      selectedColorIndex = 0,
      selectedsimilarcolorIndex = 0;
  int purchaseCount = 1;
  int _scrolledImagesIndex = 0; // Define _scrolledImagesIndex

  set scrolledImagesIndex(int index) {
    // Define setter for _scrolledImagesIndex
    setState(() {
      _scrolledImagesIndex = index;
      selectedsimilarcolorIndex =
          0; // Reset selectedsimilarcolorIndex when scrolledImagesIndex changes
      purchaseCount = 0; // Reset purchaseCount when scrolledImagesIndex changes
    });
  }

  Widget getColor(int index) {
    return GestureDetector(
      onTap: () {
        selectedColorIndex = index;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 31,
        height: 31,
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedColorIndex == index
                    ? Color(colorList[index])
                    : Colors.white,
                width: 1),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(31)),
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Color(colorList[index]),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorIndex(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedsimilarcolorIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 100,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color(0xffE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6)),
          ],
          border: Border.all(
              color: selectedsimilarcolorIndex == index
                  ? Colors.indigo
                  : Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/${similarImages[index]}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    images = widget.model.differentImageurl.keys.toList();
    similarImages =
        widget.model.differentImageurl[images[_scrolledImagesIndex]]!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffE7EEF8),
                            blurRadius: 4,
                            offset: Offset(2.3, 2.3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.keyboard_backspace),
                    ),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffE7EEF8),
                            blurRadius: 4,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cartscreen()));
                          },
                          child: const Icon(Icons.local_grocery_store)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Cartscreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffE7EEF8),
                            blurRadius: 4,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
              //Images show
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 12,
                            child: Stack(
                              children: [
                                Container(
                                  height: 220,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xffE7EEF8),
                                        blurRadius: 1,
                                        offset: Offset(4.6, 4.6),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: PageView.builder(
                                    itemCount: images?.length ?? 0,
                                    controller:
                                        PageController(viewportFraction: 0.55),
                                    onPageChanged: (i) => setState(() {
                                      selectedsimilarcolorIndex = 0;
                                      purchaseCount = 0;
                                      scrolledImagesIndex = i;
                                    }),
                                    itemBuilder: (_, i) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Image.asset(
                                            "assets/images/${images[i]}.png"),
                                        width: 90,
                                        height: 90,
                                      );
                                    },
                                  ),
                                ),
                                Positioned.directional(
                                  end: 15,
                                  top: 15,
                                  textDirection: TextDirection.ltr,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xffE3EFFE),
                                              blurRadius: 1,
                                              offset: Offset(3.6, 1.7)),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff7EEF8),
                                        blurRadius: 1,
                                        offset: Offset(2.6, 2.6)),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: colorList
                                      .asMap()
                                      .entries
                                      .map((MapEntry map) => getColor(map.key))
                                      .toList(),
                                ),
                              ),
                            ),
                          )
                        ]),
                    //similar Images
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: similarImages
                            .asMap()
                            .entries
                            .map(
                                (MapEntry map) => getSimilarColorIndex(map.key))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 12,
                          child: Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffE3EFFE),
                                    blurRadius: 1,
                                    offset: Offset(4.6, 4.6)),
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(90),
                                bottomLeft: Radius.circular(90),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.model.fullname,
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                  onRatingUpdate: (rating) {},
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  widget.model.price,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffE3EFFE),
                                  blurRadius: 1,
                                  offset: Offset(2.6, 2.6),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(65),
                                topLeft: Radius.circular(65),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (purchaseCount > 1) {
                                        purchaseCount -= 1;
                                      } else {
                                        purchaseCount = 1;
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.remove,
                                        size: 30,
                                        color: purchaseCount < 2
                                            ? Colors.grey
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: Center(
                                      child: Text(
                                        purchaseCount.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        purchaseCount += 1;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: purchaseCount < 2
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            widget.model.description,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(55),
                              bottomRight: Radius.circular(55),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffE3EFFE),
                                blurRadius: 1.0,
                                offset: Offset(2.6, 2.6),
                              )
                            ]),
                        child: InkWell(
                          onTap: () {
                            cartList.add(CategoryModel);
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
