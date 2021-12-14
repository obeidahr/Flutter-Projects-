import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping.dart';

class CartDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Shopping cart = Shopping.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart details'),
      ),
      body: Center(
        child:Text('${cart.products.length}  Selected',style: Theme.of(context).textTheme.display1,) ,
      ),
    );
  }
}