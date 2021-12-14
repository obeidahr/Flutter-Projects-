import 'package:flutter/material.dart';
import 'package:provider_extension_method/mymodel.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('read extension'),
      ),
      body: ListenableProvider(
        create: (c)=> MyModel('obeida', 22),
        child: Center(
          child: Column(
            children: [
              MyNameWidget(),
              MyNumberWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
           //read extension
// class MyNameWidget extends StatefulWidget {

//   @override
//   _MyNameWidgetState createState() => _MyNameWidgetState();
// }

// class _MyNameWidgetState extends State<MyNameWidget> {
//   MyModel myModel;
//   @override
//     void initState() {
//       myModel = context.read<MyModel>();
//       super.initState();
//     }
//   @override
//   Widget build(BuildContext context) {
//     return Text(myModel.name);
//   }
// }
class MyNameWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var myModel = Provider.of<MyModel>(context,listen: false);
    return Text(myModel.name);
  }
}

class MyNumberWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //var m = context.watch<MyModel>();
    var m = Provider.of(context,listen: true);//var m = Provider.of(context);
    return Column(
      children: [
        Text('${m.number}'),
        IconButton(
          icon:Icon(Icons.add) ,
          onPressed:(){
            m.inc();
          })
      ],
    );
  }  
}