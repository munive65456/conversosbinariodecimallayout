import 'package:conversorbinariodecimallayout/ui/widgets/decimal_binary.dart';
import 'package:flutter/material.dart';

import '../widgets/binary_decimal.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Converter',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Converter'),
          ),
          body: SafeArea(child: Switch()),
        ));
  }
}

class Switch extends StatefulWidget {
  @override
  _SwitchState createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  bool _op = true;

  _cambio2() {
    if (_op) {
      return BinaryToDecimal();
    } else {
      return DecimalToBinary();
    }
  }

  void _cambio() {
    if (_op) {
      _op = false;
    } else {
      _op = true;
    }
  }

  String _nombre() {
    if (_op) {
      return "Binary -> Decimal";
    } else {
      return "Decimal -> Binary";
    }
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
                key: Key('switch'),
                child: Text(_nombre()),
                onPressed: () {
                  _cambio();
                  setState(() {});
                })),
        Expanded(child: _cambio2()),
      ],
    );
  }
}
