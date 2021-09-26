import 'package:flutter/material.dart';

class SumRestItemQuantity extends StatelessWidget {
  final int? quantity;
  final Function onPlusTap;
  final Function onMinusTap;
  const SumRestItemQuantity({Key? key, this.quantity, required this.onMinusTap, required this.onPlusTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              onMinusTap();
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
              onPlusTap();
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