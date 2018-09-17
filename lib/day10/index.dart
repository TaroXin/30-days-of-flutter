import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Day10 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day10State();
  }
}

class _Day10State extends State<Day10> {
  String barcode = '';

  @override
  void initState() {
    super.initState();
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Day10'),
      ),

      body: new SizedBox(
        width: 400.0,
        height: 400.0,
        child: new Center(
          child: new Column(
            children: <Widget>[
              new MaterialButton(
                child: new Text('扫描二维码'),
                onPressed: scan
              ),

              new Text(barcode),

            ],
          ),
        ),
      ),
    );
  }
}