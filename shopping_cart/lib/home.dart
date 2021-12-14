import 'dart:math';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cartdetails.dart';
import 'package:shopping_cart/product.dart';
import 'package:shopping_cart/shopping.dart';

class Home extends StatelessWidget {

  List<Product> items = List.generate(101, (i){
    return Product(name: 'product $i',price: Random().nextInt(5000),isCheck: false);
  });

  @override
  Widget build(BuildContext context) {
    Shopping cart = Shopping.of(context);
    return StatefulBuilder(
      builder:(context,StateSetter setState){
        return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15,top: 10),
            child: Badge(
              badgeContent: Text('${cart.products.length}'),
              badgeColor: Colors.green,
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartDetails()));
                },
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,i){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                children: [
                  Expanded(child: Text(items[i].name)),
                  Checkbox(
                    value:items[i].isCheck,
                    onChanged: (value){
                      setState((){
                        items[i].isCheck = !items[i].isCheck;
                        if(items[i].isCheck){
                          cart.products.add(items[i]);
                        }else{
                          cart.products.remove(items[i]);
                        }
                      });
                    }),
                ],
            ),
              ),
            subtitle: Text('${items[i].price} SYR'),
            ),
          );
        },
        ),
    );
      } );
  }
}