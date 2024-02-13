// import 'package:flutter/material.dart';
// import 'package:furniture_app/model/category_model.dart';
//
// class GridItems extends StatefulWidget {
//   final int index;
//
//   GridItems(this.index);
//
//   @override
//   State<GridItems> createState() => _GridItemsState();
// }
//
// class _GridItemsState extends State<GridItems> {
//   @override
//   Widget build(BuildContext context) {
//     var index;
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: 50,
//       ),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//               color: Color(0xffEAEEF0), blurRadius: 1, offset: Offset(4.5, 4.5))
//         ],
//         color: Colors.white,
//         border: Border.all(color: Colors.indigo, width: 1.5),
//         borderRadius: widget.index == 0 || widget.index % 3 == 0
//             ? BorderRadius.only(
//                 topRight: Radius.circular(100),
//                 bottomLeft: Radius.circular(100),
//               )
//             : BorderRadius.only(
//                 topLeft: Radius.circular(100),
//                 bottomRight: Radius.circular(100),
//               ),
//       ),
//       child: Column(
//         children: [
//           Image(
//               image:
//                   AssetImage("assets/images/${categoriesGrid[index].imageurl}"),
//                  width: 100,
//             height: index%2==0?100:200,
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:furniture_app/model/category_model.dart';

class GridItems extends StatefulWidget {
  final int index;

  GridItems(this.index);

  @override
  State<GridItems> createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffEAEEF0),
            blurRadius: 1,
            offset: Offset(4.5, 4.5),
          )
        ],
        color: Colors.white,
        border: Border.all(color: Colors.indigo, width: 1.5),
        borderRadius: widget.index == 0 || widget.index % 3 == 0
            ? BorderRadius.only(
          topRight: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        )
            : BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(
                "assets/images/${categoriesGrid[widget.index].imageurl}"),
            width: 150,
            height: widget.index % 2 == 0 ? 100 : 200,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            categoriesGrid[widget.index].name,
            style: TextStyle(color: Colors.indigo, fontSize: 22),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            categoriesGrid[widget.index].price,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
