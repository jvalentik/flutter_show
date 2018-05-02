import 'package:flutter/material.dart';

void main() => runApp(new FlutterShowApp());

class FlutterShowApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FlutterShowState();
  }
}

class FlutterShowState extends State<FlutterShowApp> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("FlutterShow"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh, color: Colors.white),
                onPressed: () {
                  print("reloading...");
                  setState(() {
                    _isLoading = false;
                  });
                })
          ]
        ),
        body: new Center(
          child: _isLoading ? new  CircularProgressIndicator() :
              new Text("Finshed Loading..."),
        ),
      ),
    );
  }
}
