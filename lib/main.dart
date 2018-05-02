import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new FlutterShowApp());

class FlutterShowApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FlutterShowState();
  }
}

class FlutterShowState extends State<FlutterShowApp> {
  var _isLoading = true;
  _fetchData() async {
    final url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    print('Attempting to fetch data');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map =json.decode(response.body);
      final videos = map['videos'];
      videos.forEach((video) {
        print(video['name']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("FlutterShow"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                    Icons.refresh,
                    color: Colors.white),
                onPressed: () {
                  print("reloading...");
                  setState(() {
                    _isLoading = false;
                  });
                  _fetchData();
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
