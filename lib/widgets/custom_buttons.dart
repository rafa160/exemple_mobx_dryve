import 'package:dryve_exp/strings.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 13, right: 13),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration:
              BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(5)), border: Border.all(color: Colors.grey)),
              child: FlatButton(
                child: Text(Strings.CUSTOM_BUTTON_CLEAR, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,),),
                onPressed: (){},
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration:
              BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.blueAccent, border: Border.all(color: Colors.blueAccent)),
              child: FlatButton(
                child: Text(Strings.CUSTOM_BUTTON_ADD, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                  onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
