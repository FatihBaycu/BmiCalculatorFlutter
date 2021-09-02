import 'package:bmi_calculator/my_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bmi_detail.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData.light(),
      title: "VKİ Hesaplayıcı",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    bool isBlur=true;
  opacitySwap() {  isBlur = !isBlur;}
  double width=170;
  double weight=50;
  double newValue=0;

  var staticValues=MyValues();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 30,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(15.0), child: Text(MyValues.vkiNedir,style: TextStyle(fontSize: 18,color: Colors.blueGrey.shade400),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildGestureDetectorMan(),
                buildGestureDetectorVoman(),
              ],
            ),
            SizedBox(height: 50,),
            buildContainer(),
            buildContainerWidth(),

            LayoutBuilder(builder: (context, BoxConstraints constraints)=>constraints.maxWidth>600?buildButton(0.9,0.2):buildButton(0.9,0.07)),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }

  Center buildButton(double width,double height) {
    return Center(
              child: SizedBox(
                width: Get.width*width,
                height: Get.height*height,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(changeColor()),
                  ),
                  onPressed: (){
                    isMyWeightNormal(26);
                     Get.off(()=>BmiDetail(
                      weightMessage:    getBmiMessage(calculateBmi(width: width,weight: weight,gender: isBlur)),
                      bmiNumber:        calculateBmi(width: width,weight: weight,gender: isBlur).toString(),
                      idealWeight:      calculateIdealWeight(gender: isBlur,width: width),
                      isMyWeightNormal: isMyWeightNormal(calculateBmi(width: width,weight: weight,gender: isBlur)),
                       weightWarningColor: getWeightWarningColor(calculateBmi(width: width,weight: weight,gender: isBlur)),
                     ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("VKi Hesapla",style: TextStyle(fontSize: 20),),
                      Icon(Icons.arrow_right_alt),
                    ],
                  ),),
              ),
            );
  }

  AppBar buildAppBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white30,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("VKİ",style: TextStyle(fontSize: 30,color: changeColor()),),
          Text(" Hesaplayıcı",style: TextStyle(fontSize: 30,color: Colors.black),),
        ],
      ),
    );
  }

  Container buildContainerWidth() {
    return Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                    border:Border.all(color: Colors.black12,width: 3) ,
                  borderRadius: new BorderRadius.all(Radius.circular(20.0),
                  ),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Expanded(
                      flex:1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.add_road,color: changeColor(),),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize:14,color: Colors.black),
                                children: [
                              TextSpan(text: "Boy",style: TextStyle(color: Colors.purple)),
                              TextSpan(text: " (cm)",style:TextStyle(color: changeColor())),
                            ]),
                          ),
                        ],
                      ),
                    ),

                    Expanded( flex:5,child:
                      Slider(value: width,min: 90, max: 220, divisions: 130, activeColor:changeColor(),
                        onChanged: (double value)=>setState(()=>width = value),
                        label: width.roundToDouble().toString(),),),
                  ],
                ),
              );
  }

  Container buildContainer() {
    return Container(
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white, border:Border.all(color: Colors.black12,width: 3),
                  borderRadius: new BorderRadius.all(Radius.circular(20.0),),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex:1, child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.add_moderator,color: changeColor(),),
                          RichText(text: TextSpan(
                                style: TextStyle(fontSize:14,color: changeColor(),),
                                children: [
                                  TextSpan(text: "Kilo",style: TextStyle(color: Colors.purple)),
                                  TextSpan(text: " (kg)",),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(flex:5, child:
                      Slider(value: weight, min: 30, max: 200, divisions: 200, activeColor:changeColor(),
                      onChanged: (double value)=>setState(()=>weight = value),
                      label: weight.roundToDouble().toString(),
                      ),
                    ),
                  ],
                ),
              );
  }

  GestureDetector buildGestureDetectorVoman() {
    return GestureDetector(child:
        Container(width: Get.width * 0.4, height: Get.height * 0.3, child:
          Opacity(opacity: !isBlur? 1.0 : 0.5, child:
            Image.asset("assets/images/voman.png")),),onTap: ()=>setState(()=>opacitySwap()),
    );
  }

  GestureDetector buildGestureDetectorMan() {
    return GestureDetector(
      child: Container(width: Get.width * 0.4, height: Get.height * 0.3, child:
       Opacity(opacity: isBlur ? 1.0 : 0.5,child:
        Image.asset("assets/images/man.png")),), onTap: ()=>setState(()=>opacitySwap()));
  }

  Color changeColor()=>isBlur?Colors.blue:Colors.orange;

  String calculateIdealWeight({bool? gender, double? width}) {
    int number = 50;
    number = gender == true ? number = 50 : 45;

    var result = number + 2.3 * ((width! / 2.54) - 60);
    String value = result.toString();
    return value.substring(0, 2);
  }

  double calculateBmi({bool? gender, double? width, double? weight}) {
     int number=50;
     number = gender == true ?number = 50 : 45;

    double result = weight! / (width! * width);
    String value = result.toString().substring(4,6);
    double newVal=double.parse(value);
    return newVal;
  }
}

 String getBmiMessage(double value){
   if(value<=0)
     return MyValues.morbidObez;
  if(value>=40)
      return MyValues.morbidObez;
  if(value>=30)
      return MyValues.obez;
  if(value>=25)
      return MyValues.fazlaKilo;
  else
      return MyValues.zayif;
}

 Color getWeightWarningColor(double value){
   if(value<=0){return Colors.red;}
   if(value>=40)
    return Colors.red;
  if(value>=30)
    return Colors.redAccent.shade100;
  if(value>=25)
    return Colors.orange;
  else
    return Colors.green;
}

String isMyWeightNormal(double value){
  if(value<=0){return "Morbid Obez";}
  if(value>40){return "Morbid Obez";}
  else if(value>30){ return "Obez";}
  else if(value>25) {return "Fazla Kilo";}
  else{return "Zayif";}
}