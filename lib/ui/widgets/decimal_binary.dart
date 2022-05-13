import 'package:flutter/material.dart';

class DecimalToBinary extends StatefulWidget {
  @override
  _DecimalToBinaryState createState() => _DecimalToBinaryState();
}

class _DecimalToBinaryState extends State<DecimalToBinary> {
  //late String _binary;
  String _binary = "";
  String _decimal = "0";
  bool sw = true;

  String binario(String _decimal) {
    if (_decimal != "0") {
      _binary = int.parse(_decimal).toRadixString(2);
      return _binary;
    }
    return "";
  }

  void _onPressed(String dec) {
    if (sw) {
      _decimal = "";
      sw = false;
    }
    _decimal = _decimal + dec;
    setState(() {});
  }

  void _onReset() {
    setState(() {
      _decimal = "0";
      sw = true;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                '$_decimal',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        // Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                        Colors.purple,
                    fontSize: 35),
              )),
          Text(
            binario(_decimal),
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [keyNumber(7), keyNumber(8), keyNumber(9)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [keyNumber(4), keyNumber(5), keyNumber(6)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [keyNumber(1), keyNumber(2), keyNumber(3)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                key: Key('reset'),
                onPressed: () {
                  _onReset();
                },
                child: Text(
                  "Reset",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: Size(120, 60),
                ),
              ),
              keyNumber(0)
            ],
          ),
        ],
      ),
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
