import 'dart:async';
import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://myfamilytree-00120200612203048.azurewebsites.net/api/Families/5');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
/*  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }*/

  final id;
  final String familyName;
  final DateTime marriageDate;
  final String wifeName;
  final String husbandName;
  final String familyStatus;
  final String familyRootID;
  final  FileImage familyImage;

  Album({this.id, this.familyName, this.marriageDate, this.wifeName, this.husbandName, this.familyStatus, this.familyRootID, this.familyImage});

  factory Album.fromJson(Map<String, dynamic> json) {
    /*return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],


    );*/

    return Album(
      id: json['_id'],
      familyName: json['familyName'],
      marriageDate: json['marriageDate'],
      wifeName: json['wifeName'],
      husbandName: json['husbandName'],
      familyStatus: json['familyStatus'],
      familyRootID: json['familyRootID'],
      familyImage: json['familyImage'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.familyName);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
