import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/models/Product.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Product _product = Product();

  void _getProduct(BuildContext context) {
    if (_product.id == null)
      setState(() {
        _product = ModalRoute.of(context)!.settings.arguments as Product;
      });
  }

  @override
  Widget build(BuildContext context) {
    _getProduct(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 'hero-${_product.id}',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(_product.urlPhoto!),
                  maxRadius: 100.0,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nombre: ', style: TextStyle(fontSize: 24.0),),
                Text(_product.name!, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Color: ', style: TextStyle(fontSize: 24.0),),
                Text(_product.color!, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tamaño: ', style: TextStyle(fontSize: 24.0),),
                Text(_product.size!, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}