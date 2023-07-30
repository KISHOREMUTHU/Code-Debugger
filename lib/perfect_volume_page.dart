import 'dart:async';

import 'package:flutter/material.dart';

class HardwareButtonFindPage extends StatefulWidget {
  const HardwareButtonFindPage({Key? key}) : super(key: key);

  @override
  _HardwareButtonFindPageState createState() => _HardwareButtonFindPageState();
}

class _HardwareButtonFindPageState extends State<HardwareButtonFindPage> {
  String? _latestHardwareButtonEvent;

  StreamSubscription<String>? _buttonSubscription;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    _buttonSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hardware buttons find'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Button name: $_latestHardwareButtonEvent\n'),
            ],
          ),
        ),
      ),
    );
  }
}