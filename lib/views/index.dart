import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/models/Product.dart';
import 'package:shopping_cart_flutter/utils/fillProduct.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fillProducts();
  }

  void _fillProducts() {
    setState(() {
      _products = getRandomProductList(numberOfItems: 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cart', arguments: _products);
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          Product _product = _products[index];
          return ListTile(
            title: Text(_product.name!),
            subtitle: Text(_product.toDescription()),
            leading: SizedBox(
              height: 50.0,
              width: 50.0,
              child: Image.network(_product.urlPhoto!)
            ),
            trailing: IconButton(
              splashColor: _product.isAdded!? Colors.redAccent: Colors.green,
              color: _product.isAdded!? Colors.redAccent: Colors.green,
              onPressed: (){
                if(!_product.isAdded!)
                  _addToCart(index);
                else
                  _removeToCart(index);
              }, 
              icon: Icon(_product.isAdded!? Icons.remove_shopping_cart: Icons.add_shopping_cart)
            ),
          );
        }
      ),
    );
  }

  void _addToCart(index) {
    Product _product = _products[index];
    setState(() {
      _product.isAdded = true;
      _product.quantity = 1;
    });
  }

  void _removeToCart(index) {
    Product _product = _products[index];
    setState(() {
      _product.isAdded = false;
      _product.quantity = 0;
    });
  }
}