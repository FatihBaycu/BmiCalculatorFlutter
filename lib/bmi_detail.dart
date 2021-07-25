import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiDetail extends StatefulWidget {
  const BmiDetail({Key? key}) : super(key: key);

  @override
  _BmiDetailState createState() => _BmiDetailState();
}

class _BmiDetailState extends State<BmiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
            runSpacing: 100,
            children: [
          buildText(),
          buildInfoBox(),
          buildMyVitals(),
              Center(
                child: SizedBox(
                  child: IconButton(
                      onPressed: () => Get.off(MyHomePage()),
                      icon: Icon(Icons.replay,color: Colors.purple.shade300,)),
                ),
              )


        ]),
      ),
    );
  }

  Center buildMyVitals() {
    return Center(
            child: Wrap(
              runSpacing: 20,
              children: [
                Text("Sağlıklı VKİ Değeri : 18.5 kg/m2 - 25 kg/m2"),
                Text("Kilonuza göre sağlıklı Kilo değerleri : 42 kg - 57 kg"),
                Text("Sağlıklı bir vücudunuz var. Sağlıklı Günler !"),
              ],
            ),
          );
  }













  AppBar buildAppBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white30,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Get.off(MyHomePage()),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          Text(
            "Back",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Center buildInfoBox() {
    return Center(
            child: SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                 // border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text( "VKİ' in", style: TextStyle(fontSize: 30, color: Colors.purple.shade900),),
                    Text("22.4",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.purple.shade800),),
                    Text("kg/m2",style: TextStyle(color: Colors.purple.shade300),),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(text: "Kilonuz",style: TextStyle(fontSize: 20,color: Colors.purple.shade300)),
                            TextSpan(text: " Normal",style: TextStyle(fontSize: 20,color: Colors.green)),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  RichText buildText() {
    return RichText(
      text: TextSpan(
          style: TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan( text: "Senin", style:TextStyle(fontSize: 30, color: Colors.deepPurple.shade300)),
            TextSpan( text: " Değerlerin", style: TextStyle(fontSize: 30, color: Colors.black)),
          ]),
    );
  }
}
