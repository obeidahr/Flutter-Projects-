import 'package:flutter/material.dart';
import 'package:route_pass/product.dart';
import 'package:route_pass/second.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Product> products = List.generate(100, (index) => Product(name: 'product ${index + 1}', price: (index+1)*300));
    return Scaffold(
      appBar: AppBar(
        title:Text('Home screen') ,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,i) => ListTile(
          title: Text(products[i].name),
          trailing: Text('Price ${products[i].price}'),
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Second(products[i]) ),);
          },
        )
     ),
    );
  }
}