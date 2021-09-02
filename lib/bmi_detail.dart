import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiDetail extends StatefulWidget {
  String? weightMessage;
  String? bmiNumber;
  String? idealWeight;
  String? isMyWeightNormal;
  Color? weightWarningColor;

  BmiDetail({this.weightMessage, this.bmiNumber, this.idealWeight,this.isMyWeightNormal,this.weightWarningColor});

  @override
  _BmiDetailState createState() => _BmiDetailState();
}

class _BmiDetailState extends State<BmiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
              runSpacing: 50,
              children: [
            buildText(),
            LayoutBuilder(builder: (context, BoxConstraints constraints)=>constraints.maxWidth>600?buildInfoBox(.9, .5):buildInfoBox(.9, .2)),
            buildMyVitals(),
            buildBackButton()
          ]),
        ),
      ),
    );
  }

  Center buildBackButton() {
    return Center(
              child: SizedBox(
                child: IconButton(
                    onPressed: () => Get.off(MyHomePage()),
                    icon: Icon(Icons.replay,color: Colors.purple.shade300,)),
              ),
            );
  }

  Widget buildMyVitals() {
    return Center(
      child: Wrap(
         direction: Axis.vertical,
         spacing:10,
        children: [
          Text("Sağlıklı VKİ Değeri : 18.5 kg/m2 - 25 kg/m2",style: TextStyle(fontSize: 18),),
          Text("Kilonuza göre sağlıklı Kilo değerleri : ${widget.idealWeight}",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            child: Text(
              widget.weightMessage!,
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 18),
              maxLines:5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
          Text("Geri",style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

  Widget buildInfoBox(double width,double height) {
    return Center(
            child: SizedBox(
              width: Get.width *width,
              height: Get.height *height,
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
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1,child: Text( "VKİ' in", style: TextStyle(fontSize: 30, color: Colors.purple.shade900),)),
                    Expanded(flex: 2,child: Text(widget.bmiNumber!,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.purple.shade800),)),
                    Expanded(flex: 1,child: Text("kg/m2",style: TextStyle(color: Colors.purple.shade300),)),
                    Expanded(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(text: "Kilonuz ",style: TextStyle(fontSize: 20,color: Colors.purple.shade300)),
                              TextSpan(text: widget.isMyWeightNormal,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: widget.weightWarningColor!=null?widget.weightWarningColor:Colors.black)),
                            ]),
                      ),
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
