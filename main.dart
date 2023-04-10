
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Style.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sum App",
      home: MyHomepage(),
    );
  }

}

class MyHomepage extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return MyHomepageUI();
  }
}


class MyHomepageUI extends State<MyHomepage> {

  Map<String,double> FormValue={"Num1":0,"Num2":0};
  double SUM=0;

  @override
  Widget build(BuildContext context) {

    MyInputOnChange(InputKey,InputValue){
      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });

    }

    AddAllNumber(){
      setState(() {
        SUM=FormValue["Num1"]!+FormValue["Num2"]!;
      });
    }




    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(SUM.toString(),style: HeadTextStyle(),),
            SizedBox(height: 20,),

            TextFormField(onChanged: (value){
              //set value to Num1
              MyInputOnChange("Num1",value);



            }, decoration: AppInputStyle("first number"),),
            SizedBox(height: 20,),
            TextFormField(onChanged: (value){
              //set value to Num2
              MyInputOnChange("Num2", value);




            }, decoration: AppInputStyle("second number"),),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
              style: AppButtonStyle(),
              child: Text("Add"),
              onPressed: (){
                AddAllNumber();

              },
            ),)
          ],
        ),
      ),

    );
  }

}