import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_app/Product_screen.dart';

import 'package:furniture_app/home_screen.dart';
import 'package:furniture_app/model/category_model.dart';

import 'package:furniture_app/widgets/grid_items.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int selectedIndex = 0;
  List<String> categories = ["All", "Chairs", "Sofas", "Tables", "Beds"];
  int activeIndex = 2;
  List<Map<String, dynamic>> naveItems = [
    {'Icon': Icons.location_city_rounded, 'color': Colors.black54},
    {'Icon': Icons.compass_calibration, 'color': Colors.black54},
    {'Icon': Icons.bookmark, 'color': Colors.black54},
    {'Icon': Icons.mail, 'color': Colors.black54},
    {'Icon': Icons.person, 'color': Colors.black54},
  ];



  Widget getCategories(int Index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = Index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  selectedIndex == Index ? Colors.indigo : Colors.transparent,
              width: 1.5),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffE7EEF8),
              blurRadius: 1,
              offset: Offset(2.6, 2.6),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: Center(
          child: Text(
            categories[Index],
            style: const  TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                          offset: Offset(2.3, 2.3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(Icons.menu),
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
            //search bar
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(left: 20, right: 15),
              height: 55,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffE7EEF8),
                    blurRadius: 4,
                    offset: Offset(2.3, 2.3),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
                border: Border.all(color: Colors.indigo, width: 1.5),
              ),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_alt_rounded),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories
                    .asMap()
                    .entries
                    .map((MapEntry map) => getCategories(map.key))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // items gridview

            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: categoriesGrid.asMap().entries.map((MapEntry map) {
                int index = map.key;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productscreen(categoriesGrid[index]),
                        ));
                  },
                  child: GridItems(index),
                );
              }).toList(),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        height: 60,
        circleWidth: 60,
        activeIndex: activeIndex,
        circleColor: Colors.indigo,
        color: Colors.white,
        activeIcons: List.generate(
          naveItems.length,
          (index) => Icon(naveItems[index]['icons'], color: Colors.white),
        ),
        inactiveIcons: List.generate(
          naveItems.length,
          (index) => Icon(naveItems[index]['icons'], color: Colors.black54),
        ),
      ),
    );
  }
}
