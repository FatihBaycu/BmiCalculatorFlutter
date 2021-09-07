class Calculations{

  static double calculateBmi({bool? gender, double? width, double? weight}) {
     int number=50;
     number = gender == true ?number = 50 : 45;

    double result = weight! / (width! * width);
    String value = result.toString().substring(4,6);
    double newVal=double.parse(value);
    return newVal;
  }

}