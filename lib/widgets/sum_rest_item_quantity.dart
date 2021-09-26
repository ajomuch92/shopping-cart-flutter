import 'package:flutter/material.dart';

class SumRestItemQuantity extends StatefulWidget {
  final int? quantity;
  SumRestItemQuantity({Key? key, this.quantity}) : super(key: key);

  @override
  _SumRestItemQuantityState createState() => _SumRestItemQuantityState(quantity: this.quantity);
}

class _SumRestItemQuantityState extends State<SumRestItemQuantity> {
  int? quantity;

  _SumRestItemQuantityState({this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              if(quantity! > 1)
                setState(() {
                  quantity = quantity! - 1;
                });
            },
            child: Icon(Icons.remove),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(10, 10),
            ),
          ),
          Text(quantity!.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                quantity = quantity! + 1;
              });
            },
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              minimumSize: Size(10, 10),
            ),
          ),
        ],
      ),
    );
  }
}