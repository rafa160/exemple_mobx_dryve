import 'dart:convert';

import 'package:flutter/material.dart';

class BrandItem extends StatefulWidget {
  String image;
  String brandName;

  BrandItem({this.image, this.brandName});

  @override
  _BrandItemState createState() => _BrandItemState();
}

class _BrandItemState extends State<BrandItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [

          Text(widget.brandName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

}
