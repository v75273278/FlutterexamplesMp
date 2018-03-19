import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: 'XXXXXXXXX', home: new TipCalculator()));
}

class TipCalculator extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  String name = 'mp';

  @override
  Widget build(BuildContext context) {
    // Create first input field
    TextField billAmountField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: new InputDecoration(labelText: "Bill amount(\$)"),
    );

    // Create another input field
    TextField tipPercentageField = new TextField( 
        decoration: new InputDecoration(labelText: "Tip %", hintText: "15"),
        keyboardType: TextInputType.number,  
        onChanged: (String value) {
          try {
            tipPercentage = double.parse(value);
          } catch (exception) {
            tipPercentage = 0.0;
          }
        });

  //  Text downText = new Text(
  //    'lalalal,$name is the 666lalalallalalallalalallalalallalalallalalallalalallalalallalalallalalallalalallalalallalalallalalallalalal',
  //    textAlign: TextAlign.center,
  //    textDirection: TextDirection.ltr,
  //    overflow: TextOverflow.clip,
  //    style: new TextStyle(fontWeight: FontWeight.bold,color:Colors.red,decorationColor: Colors.blueGrey),
  //    maxLines: 2,

  //  );

        double tempwidth = MediaQuery.of(context).size.width;
        double deviceHeight =MediaQuery.of(context).size.height;
        Image posImg = new Image(
              image:new NetworkImage('https://i.imgur.com/hgYw6LM.png'),
              width: (tempwidth-120.0),
              //height: (deviceHeight/2.0),
              height: 100.1,
              alignment: new Alignment(3.3 , 28.8),
             // height: MediaQuery.of(context).size.height, 
              // width: 200.1,
             //r  height: 120.2,
        );




      CircleAvatar circleAva = new CircleAvatar(
          backgroundImage: posImg.image,
          radius: 20.0,
      );


    
  Banner tempBanner = new Banner(
    child: new Image(
      image:new NetworkImage ('https://i.imgur.com/hgYw6LM.png'),
    ),
    color: Colors.cyan,
    message: 'the banber message',
    location: BannerLocation.bottomStart,

  );


    // Create button
    RaisedButton calculateButton = new RaisedButton(
        
        elevation: 80.1,
        padding: new EdgeInsets.only(left: 1.0,right: 2.0,top: 3.3,bottom: 4.9),
        child: new Text("Calculate get result btn"),
        onPressed: () {
          // Calculate tip and total
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

          // Generate dialog
          AlertDialog dialog = new AlertDialog(
              content: new Text("Tip: \$$calculatedTip \n"
                  "Total: \$$total"));

          // Show dialog
          showDialog(context: context, child: dialog);
        }); 
    
    
    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [tempBanner,circleAva,calculateButton,billAmountField, tipPercentageField, posImg,calculateButton]));

    AppBar appBar = new AppBar(
      title: new Text("Tip Test  lalalalalalalalla"),
      backgroundColor:Colors.red,
      //bottom: BottomAppBar,
    );

    Scaffold scaffold = new Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}
