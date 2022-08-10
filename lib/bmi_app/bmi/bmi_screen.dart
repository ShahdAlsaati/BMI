import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bmi_resulte/BMI_Result_Screen.dart';

class BmiScreen extends StatefulWidget {



  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
   bool isMale=false;

  double h=120;
  int w=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purple,
        title: Text('BMI Calculater'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                           setState(() {
                                   isMale=true;
                           });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                            ),

                          SizedBox(
                            height: 15,
                          ),
                          Text('Male',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),)
                        ],),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                             color: isMale ?Colors.purple: Colors.grey[400],                       ) ,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;

                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                        size: 100,
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            Text('Female',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),)
                          ],),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: !isMale ?Colors.purple: Colors.grey[400],                      ) ,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20 ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10,),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline:TextBaseline.alphabetic ,
                      children: [
                      Text('${h.round()}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),),
                      SizedBox(
                        width: 10,
                      ),
                      Text('CM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],),
                    Slider(value:h,
                      inactiveColor:Colors.purple.shade100,
                      activeColor:Colors.purple,
                      thumbColor: Colors.purple,
                      max: 220,
                      min: 80,
                      onChanged:(v){
                      setState(() {
                        h=v;
                      });
                      print(v.round());
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.grey[400],
                      ) ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          Text('WEIGHT',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text('${w}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor:Colors.purple,
                                onPressed: (){
                                  setState(() {
                                    w--;
                                  });
                              },
                                heroTag: 'w-',
                                mini: true,
                              child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor:Colors.purple,
                                onPressed: (){
                                setState(() {
                                  w++;
                                });
                              },
                                heroTag: 'w+',
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        color: Colors.grey[400],
                      ) ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          Text('AGE',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text('${age}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                              backgroundColor:Colors.purple,
                                onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag: 'age-',
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor:Colors.purple,
                                onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age+',
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 50,
            color: Colors.purple,
            child: MaterialButton(onPressed: (){
              var result = w/pow(h/100,2);
                  print(result.round());
                  Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context)=>BMIResultScreen(
                          age: age,
                          isMale:isMale,
                          result: result.round(),
                        ),
                      ),
                  );

            },
              child: Text('CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),

              ),

            ),
          ),

        ],
      ),

    );
  }
  /*var result = w/pow(h/100,2);
  print(result.round());
   */
}
