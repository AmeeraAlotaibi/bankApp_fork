import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.black12,
          width: 1,
        )),
      ),
      child: Card(
        elevation: 0,
        color: Color(0xFFfafafa),
        // color: Colors.pink[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ********** ICON TYPE
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(12, 0, 0, 0),
              ),
              child: Icon(
                Icons.attach_money_rounded,
                size: 35,
                color: Colors.green,
              ),
            ),
            // ************* DATE AND TRANSACTION TYPE
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deposit".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "01 JULY 2022",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),

            Column(
              children: [
                Text(
                  "+\$500",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Amount",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.5,
                    letterSpacing: 0.25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
