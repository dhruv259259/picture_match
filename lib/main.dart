import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:picture_match/level_page.dart';
import 'package:picture_match/no_time_limit.dart';

void main() {
  runApp(MaterialApp(
    home: picture(),
    debugShowCheckedModeBanner: false,
  ));
}

class picture extends StatefulWidget {
  const picture({Key? key}) : super(key: key);

  @override
  State<picture> createState() => _pictureState();
}

class _pictureState extends State<picture> {
  bool t = false;
  int b = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Select mode"),
          actions: [
            (t == true)
                ? IconButton(
                onPressed: () {
                  setState(() {
                    t = false;
                  });
                },
                icon: Icon(Icons.volume_off))
                : IconButton(
                onPressed: () {
                  setState(() {
                    t = true;
                  });
                },
                icon: Icon(Icons.volume_up_rounded)),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: () async {
                      await FlutterShare.share(
                          title: 'Example share',
                          text: 'Picture Match',
                          linkUrl: 'https://flutter.dev/',
                          chooserTitle: 'Example Chooser Title');
                    },
                    child: Text("SHARE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                PopupMenuItem(child: Text("MORE GAMES",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                PopupMenuItem(child: Text("PRIVACY POLICY",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              ],
            )
          ],
          backgroundColor: Color(0xFF3C6553)),
      body: Column(children: [
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("image/1.png"))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 170,
                    height: 170,
                    child: Column(children: [
                      Expanded(
                        child: InkWell(onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return puzzle();
                          },));
                        },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: double.infinity,
                            child: Text(
                              "NO TIME LIMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return level();
                          },));
                        },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: double.infinity,
                            child: Text("NORMAL",
                                style: TextStyle(color: Colors.white)),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                          child: Text("HARD",
                              style: TextStyle(color: Colors.white)),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green),
                        ),
                      ),
                    ]), decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(width: 5, color: Colors.greenAccent))),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 130,
                  height: 70,
                  child: Container(
                      height: 30,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "REMOVE ADS",
                        style: TextStyle(color: Colors.white),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(color: Colors.greenAccent, width: 5)),
                ),
                Container(
                  width: 272,
                  height: 70,
                  child: Row(children: [
                    Container(alignment: Alignment.center,margin: EdgeInsets.all(5),child: Text("SHARE",style: TextStyle(color: Colors.white),),height: 60,width: 120, decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 5)),),
                    Container(alignment: Alignment.center,margin: EdgeInsets.all(5),child: Text("MORE GAMES",style: TextStyle(color: Colors.white),),height: 60,width: 120, decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 5)),),
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.greenAccent, width: 5)),
                )
              ],
            ),
          ),
        ),
        Container(
          color: Colors.teal,
          width: double.infinity,
          height: 70,
        )
      ]),
    );
  }
}
