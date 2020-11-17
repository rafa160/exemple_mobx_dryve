import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class BrandItem extends StatefulWidget {
  final String image;
  final String brandName;

  BrandItem({this.image, this.brandName});

  @override
  _BrandItemState createState() => _BrandItemState();
}

class _BrandItemState extends State<BrandItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 1),
      child:  Row(
          children: [
        CheckboxGroup(
        labels: <String>[
          widget.brandName,
            ],
            onSelected: (List<String> checked) => print(checked.toString())
      ),
          ],
        ),
    );
  }

}
