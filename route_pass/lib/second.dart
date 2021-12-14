import 'package:flutter/material.dart';
import 'package:route_pass/product.dart';

class Second extends StatelessWidget {
  Product product;
  Second(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Second screen') ,
      ),
      body:Center(
        child:Column(
          children: [
            Text('${product.name}',style: Theme.of(context).textTheme.headline,),
            SizedBox(height: 200,),
            Text('price ${product.price}'),
          ],
          ) 
        ,)
    );
  }
}