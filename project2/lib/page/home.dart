import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double fahTemp =0.0,celTemp=0.0,kalTemp=0.0;
  bool isFah = true;
  var tem1 = ['celsius','fahrenhiet','kalvin'];
  var selected1='celsius';
  var selected2 ='kalvin';
  var fahController = TextEditingController();
  var celController = TextEditingController();
  var kalController = TextEditingController();
  @override
  initState(){
    super.initState();
    fahController.addListener(fahListener);
    celController.addListener(celListener);
    kalController.addListener(kalListener);
  }
  fahListener(){
    setState(() {
      fahTemp = double.parse(fahController.text);
      celTemp = convert(fahTemp, true);
      if(isFah) celController.text = celTemp.toString();
      isFah= true;      
    });
  }
  celListener(){
    setState(() {
      celTemp = double.parse(celController.text);
      fahTemp = convert(celTemp, false);
      if(!isFah) fahController.text = fahTemp.toString();
      isFah = false;      
    });
  }
  kalListener(){
    setState(() {
      kalTemp = double.parse(kalController.text);
      fahTemp = convert2(kalTemp, true);
      celTemp = convert1(kalTemp, true);
    });
  }



  double convert(double temp,bool isF){
    return isF ? (temp - 32) * (5/9):(temp * 9 / 5) + 32;
  }
  double convert1(double temp,bool isk){//k to c & c to k
    return isk ? (temp -273.15): (temp+273.15);
  }
  double convert2(double temp,bool isk){//k to f & f to k
    return isk ? (1.8)*(temp - 273) + 32 : (temp + 459.67) * (5/9);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child:Column(
              children: [
                DropdownButton(
                  items: tem1.map((item){
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                      );
                  }).toList(),
                  value: selected1,
                  onChanged: (newValue){
                    setState(() {
                      selected1=newValue;                    
                    });
                  },
                ),
                TextField(
                  controller: kalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(suffixText: '$selected1'),
                ),
              ],
            )),
            SizedBox(
              width: 50,
            ),
            Expanded(child:Column(
              children: [
                DropdownButton(
                  items: tem1.map((item){
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                      );
                  }).toList(),
                  value: selected2,
                  onChanged: (newValue){
                    setState(() {
                      selected2=newValue;                    
                    });
                  },
                ),
                TextField(
                  controller: celController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(suffixText: '$selected2'),
                ),
              ],
            ),),           
          ],
        ),
      ),
    );
  }
}