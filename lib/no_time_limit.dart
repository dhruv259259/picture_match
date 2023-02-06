import 'dart:convert';

import 'package:bubble_slider/bubble_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

class puzzle extends StatefulWidget {
  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
  List img_list=[];
  List myimg=[];
  int click=1;
  int p1=0,p2=0;
  double a=1;
  bool t = false;
  List<bool> isOpen=List.filled(12,true);
  @override
  void initState() {
    super.initState();
    get();
    _initImages();

  }

  Future _initImages() async {

    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('image/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() async {
      img_list = imagePaths;
      img_list.shuffle();
      for(int i=0;i<6;i++)
      {
        myimg.add(img_list[i]);
        myimg.add(img_list[i]);
      }
      print(myimg);
      myimg.shuffle();
    });
    return myimg;
  }
get() async {
  for(int i=1;i<=5;i++) {
     await Future.delayed(Duration(seconds: 1));
     setState(() {
       a++;
     });
    }
  isOpen=List.filled(12, false);

}
  notmatch(int p1 ,int p2)async{
    await Future.delayed(Duration(milliseconds: 600));
    isOpen[p1]=false;
    isOpen[p2]=false;
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Select mode"),
          actions: [
            Align(alignment: Alignment.center,child: Text("NO TIME LIMIT"),),
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
        backgroundColor: Color(0xFFC5D7D0),
      body: Column(children: [
        Expanded(
            child: Container(child: BubbleSlider(value: a, onChanged: (value) {}, onChangeEnd: (value) {},min: 1,max:6,isBubbleVisible: true,bubbleSize: BubbleSize.small,bubblesSpeed: BubbleSize.medium,color: Colors.black),
            )),
        Expanded(flex: 8,
            child: Container(margin: EdgeInsets.only(top: 10,bottom: 10),
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,

                child:GridView.builder(itemCount:12 ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Visibility(
                        visible: isOpen[index],
                        replacement:InkWell(
                            onTap: (){
                              if(click==1)
                              {
                                setState(() {
                                  isOpen[index]=true;
                                  click=2;
                                  p1=index;
                                });
                              }
                              else
                              {
                                setState(() {
                                  isOpen[index]=true;
                                  click=1;
                                  p2=index;
                                });
                                if(myimg[p1]!=myimg[p2])
                                {
                                  notmatch(p1,p2);
                                }
                                if(isOpen[0]==true&&isOpen[1]==true &&isOpen[2]==true&&isOpen[3]==true&&isOpen[4]==true&&isOpen[5]==true&&isOpen[6]==true&&isOpen[7]==true&&isOpen[8]==true&&isOpen[9]==true&&isOpen[10]==true&&isOpen[11]==true)
                                  {
                                    showDialog(context: context, builder: (context) {
                                      return AlertDialog(actions: [
                                        OutlinedButton(style: ButtonStyle(alignment: Alignment.center,elevation: MaterialStateProperty.all(50),backgroundColor: MaterialStateProperty.all(Colors.black),shadowColor: MaterialStateProperty.all(Colors.blue[100])),onPressed: () {
                                        Navigator.pop(context);
                                      }, child:Text("NEXT LEVEL"))

                                      ],content: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,children: [
                                        Text("NO TIME LIMIT",style: TextStyle(color: Colors.white)),
                                        Text("LEVEL 1",style: TextStyle(color: Colors.white)),
                                        Text("WELL DONE!",style: TextStyle(color: Colors.white)),
                                      ]),title: Align(alignment: Alignment.center,child: Text("NEW RECORD!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),backgroundColor:Colors.black ,alignment: Alignment.center,);
                                    },);
                                  }

                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(2)
                              ,decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(8),color: Colors.teal),)),
                        child:InkWell(child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(2)
                          ,decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(8),image: DecorationImage(image: AssetImage("${myimg[index]}"))),),)


                    );
                  },
                )
            )),
        Expanded(child: Container(color: Colors.teal,))
      ]),
    );
  }

}
