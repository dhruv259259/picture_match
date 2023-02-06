import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class level extends StatefulWidget {
  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF3C6553),
          title: Text("Select level"),
          actions: [
            Align(alignment: Alignment.center, child: Text("NO TIME LIMIT")),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: Text(
                  "SOUND ON",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                PopupMenuItem(
                    child: Text(
                  "SHARE",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                PopupMenuItem(
                    child: Text(
                  "MORE GAMES",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                PopupMenuItem(
                    child: Text(
                  "PRIVACY POLICY",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              ],
            )
          ]),
      // body: Expanded(
      //     child: Container(
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 fit: BoxFit.fill, image: AssetImage("image/1.png"))))),
    );
  }
}
