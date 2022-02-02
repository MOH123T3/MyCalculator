import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

late int firstnum;
late int secondnum;
late String texttodisplay = "";
late String result;
late String operator;

void clicked(String num){
  if(num == "C"){
    texttodisplay = "";
    firstnum=0;
    secondnum=0;
    result = "";
  }
  else if(num == '+'|| num == '-' || num == 'x' || num == '/' ){
    firstnum = int.parse(texttodisplay);
    result = "";
    operator = num ;
  }
  else if(num == "="){
    secondnum = int.parse(texttodisplay); 
    if(operator == '+'){
      result = (firstnum + secondnum).toString();
    }
    if(operator == '-'){
      result = (firstnum - secondnum).toString();
    }
    if(operator == 'x'){
      result =(firstnum * secondnum).toString();
    }
    if(operator == '/'){
      result = (firstnum / secondnum).toString();
    }
  }
  else{
    result = int.parse(texttodisplay + num).toString();
  }
  setState(() {
    texttodisplay = result;
    
  });
}

  Widget customButton(String num){
    return Expanded(
      child: OutlinedButton(onPressed: ()=> clicked(num),
      child: Text("$num",style: TextStyle(fontSize: 25,color: Colors.yellow),),
      
      ));

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("""            MY CALCULATOR""",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),backgroundColor: Colors.yellow,actions: [
        Icon(Icons.calculate,color: Colors.black,)
      ],),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Expanded(child:Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text("$texttodisplay",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),) ),
          Row(
            children: [
            customButton('9'),SizedBox(width: 5,),
            customButton('8'),SizedBox(width: 5,),
            customButton('7'),SizedBox(width: 5,),
            customButton('+'),SizedBox(width: 5,),

          ],),
             Row(
            children: [
            customButton('6'),SizedBox(width: 5,),
            customButton('5'),SizedBox(width: 5,),
            customButton('4'),SizedBox(width: 5,),
            customButton('-'),SizedBox(width: 5,),

          ],),
             Row(
            children: [
            customButton('3'),SizedBox(width: 5,),
            customButton('2'),SizedBox(width: 5,),
            customButton('1'),SizedBox(width: 5,),
            customButton('x'),SizedBox(width: 5,),

          ],),
             Row(
            children: [
            customButton('C'),SizedBox(width: 5,),
            customButton('0'),SizedBox(width: 5,),
            customButton('='),SizedBox(width: 5,),
            customButton('/'),SizedBox(width: 5,),

          ],),
        ],),
      )
      ),
    );
  }
}