import 'package:flutter/material.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:furniture_app/utils/cartlist.dart';

class ListItems extends StatefulWidget {
  final int index;

  ListItems(this.index);

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  int purchaseCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Color(0xffE7EEF8),
            blurRadius: 1,
            offset: Offset(2.6, 2.6),
          ),
        ],
        color: Colors.white,
        borderRadius: widget.index == 0 || widget.index % 3 == 0
            ? BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRect(
              child: Image.asset(
                  'assets/images/${categoriesGrid[widget.index].imageurl}',
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoriesGrid[widget.index].name,
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                categoriesGrid[widget.index].price,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (purchaseCount > 1) {
                      purchaseCount -= 1;
                    } else {
                      purchaseCount = 1;
                    }

                    setState(() {},

                    );
                  },
                  child: Container(
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: purchaseCount < 2 ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                    child: Text(
                      purchaseCount.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      purchaseCount += 1;
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: purchaseCount < 2 ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
                InkWell(onTap: () {
                  setState(() {
                    cartList.removeAt(widget.index);
                  });
                },child: Icon(Icons.delete))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
int count = 0;