import 'package:flutter/material.dart';

class BinaryToDecimal extends StatefulWidget {
  @override
  _BinaryToDecimalState createState() => _BinaryToDecimalState();
}

class _BinaryToDecimalState extends State<BinaryToDecimal> {
  String _binary = "";

  String decimal(String _binary) {
    String _decimal = "0";
    if (_binary != "") {
      _decimal = int.parse(_binary, radix: 2).toRadixString(10);
    }
    return _decimal;
  }

  void _onPressed(String bin) {
    _binary = _binary + bin;
    setState(() {});
  }

  void _onReset() {
    setState(() {
      _binary = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_binary',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          // Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                          Colors.red,
                      fontSize: 35),
                )),
            Text(
              decimal(_binary),
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  keyNumber(1),
                  keyNumber(0),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 100.0),
                  child: ElevatedButton(
                    key: Key('reset'),
                    onPressed: () {
                      _onReset();
                    },
                    child: Text(
                      "reset",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(120, 60),
                    ),
                  ),
                )
              ],
            ),
          ]),
    );
  }

  Widget keyNumber(number) {
    return ElevatedButton(
        key: Key(number.toString()),
        onPressed: () {
          _onPressed(number.toString());
        },
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.red, fixedSize: Size(120, 60)));
  }
}
