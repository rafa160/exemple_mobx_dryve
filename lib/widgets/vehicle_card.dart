import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:intl/intl.dart";

class VehicleCard extends StatelessWidget {
  String image;
  String brandName;
  String modelName;
  int year;
  String fuelType;
  String transmissionType;
  int mileage;
  int price;
  VoidCallback onPressed;

  VehicleCard(
      {this.image,
      this.brandName,
      this.modelName,
      this.year,
      this.fuelType,
      this.transmissionType,
      this.mileage,
      this.price,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Text(
                  brandName,
                  style: TextStyle(
                      color: Colors.black.withBlue(100),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  modelName,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              '$year'.toString() + ' - ' + '$fuelType',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    '$transmissionType',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  ' - ', style:TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w700),
                ),Text(
                    '$mileage'.toString() + ' km',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700),
                  ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              'R\$ $price'.toString(),
              style: TextStyle(
                  color: Colors.black.withBlue(100),
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
