import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:furniture_app/utils/cartlist.dart';
import 'package:furniture_app/widgets/list_items.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartList) {
      double price = double.parse(item['price']);
      total += (item['quantity'] * price);
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                        child: Icon(Icons.keyboard_backspace_rounded),
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
                        child: Icon(Icons.local_grocery_store),
                      ),
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
                        child: const Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: categoriesGrid.asMap().entries.map((MapEntry map) {
                    int index = map.key;
                    return GestureDetector(
                      onTap: () {},
                      child: ListItems(index),
                    );
                  }).toList(),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "\224680",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 60,
                    decoration: BoxDecoration(
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
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
