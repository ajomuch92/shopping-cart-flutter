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
  List<Product> _allProducts = [];

  void _fillProducts(BuildContext context) {
    if (_products.isEmpty && _allProducts.isEmpty) {
      setState(() {
        _allProducts = (ModalRoute.of(context)!.settings.arguments as List<Product>).map((e) => e.clone()).toList();
        _products = _allProducts.where((element) => element.isAdded!).toList();
      });
    }
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
            subtitle: Text('${_product.size} ${_product.color}'),
            trailing: SumRestItemQuantity(
              quantity: _product.quantity!,
              onPlusTap: () {
                setState(() {
                  _product.quantity = _product.quantity! + 1;
                });
              },
              onMinusTap: () {
                if(_product.quantity! > 1)
                  setState(() {
                    _product.quantity = _product.quantity! - 1;
                  });
              },
            ),
            leading: IconButton(
              padding: EdgeInsets.all(2.0),
              onPressed: () {
                _removeFromCart(index, _product.id!);
              },
              icon: Icon(Icons.delete, color: Colors.red,),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveAll,
        child: Icon(Icons.save),
      ),
    );
  }

  void _removeFromCart(int index, int id) {
    int index = _allProducts.indexWhere((element) => element.id == id);
    setState(() {
      _allProducts[index].isAdded = false;
      _allProducts[index].quantity = 0;
      _products.removeAt(index);
    });
  }

  void _saveAll() {
    for(Product _product in _products) {
      int _index = _allProducts.indexWhere((element) => element.id == _product.id);
      _allProducts[_index] = _product;
    }
    Navigator.pop(context, _allProducts);
  }
}