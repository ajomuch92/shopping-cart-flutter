import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/models/Product.dart';
import 'package:shopping_cart_flutter/widgets/sum_rest_item_quantity.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> _products = [];

  void _fillProducts(BuildContext context) {
    List<Product> _allProducts = ModalRoute.of(context)!.settings.arguments as List<Product>;
    setState(() {
      _products = _allProducts.where((element) => element.isAdded!).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    _fillProducts(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          Product _product = _products[index];
          return ListTile(
            title: Text(_product.name!),
            subtitle: Text(_product.toDescription()),
            trailing: SumRestItemQuantity(quantity: _product.quantity!,),
          );
        }
      ),
    );
  }
}