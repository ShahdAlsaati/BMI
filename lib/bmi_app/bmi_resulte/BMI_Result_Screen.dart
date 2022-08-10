import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  late  int result;
  late bool isMale;
  late int age;
  BMIResultScreen({
   required this.result,
    required this.isMale,
    required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading:
      IconButton(
        onPressed:() {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
        ),
      ),
        title: Text('BMI Result',),
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 250,
          decoration:BoxDecoration(

            borderRadius: BorderRadius.circular(10,),
            color: Colors.purple.shade200,                      ) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender: ${isMale?'Male':'Female'}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

              ),
              Text(
                'Age: ${age}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

              ),
              Text(
                'Result: ${result}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

              ),

            ],
          ),
        ),
      ),

    );
  }


}
