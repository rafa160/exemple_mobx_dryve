import 'package:flutter/material.dart';

class ColorItem extends StatefulWidget {
  final String colorId;
  final String name;

  const ColorItem({Key key, this.colorId, this.name}) : super(key: key);

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          Center(
              child: InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: getColorsName(),
                  border: Border.all(
                      color: _value ? Colors.blue : Colors.grey,
                      width: _value ? 2 : 2)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _value
                    ? Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.check_box_outline_blank,
                        size: 20,
                        color: Colors.transparent,
                      ),
              ),
            ),
          )),
          SizedBox(
            width: 10,
          ),
          Text(widget.name),
        ],
      ),
    );
  }

  Color getColorsName() {
    if (widget.name == 'Branco') {
      return Colors.white;
    }
    if (widget.name == 'Prata') {
      return Colors.grey;
    }
    if (widget.name == 'Preto') {
      return Colors.black;
    }
    if (widget.name == 'Vermelho') {
      return Colors.red;
    }
  }
}
