import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SortPlayer extends StatefulWidget {
  SortPlayer(this.batsman_list, this.bowler_list);
  final List batsman_list;
  final List bowler_list;
  @override
  _SortPlayerState createState() =>
      _SortPlayerState(this.batsman_list, this.bowler_list);
}

class _SortPlayerState extends State<SortPlayer> {
  final List batsman_list;
  final List bowler_list;
  _SortPlayerState(this.batsman_list, this.bowler_list);
  final dbRef = FirebaseDatabase.instance.reference().child("batsman");
  final dbRef2 = FirebaseDatabase.instance.reference().child("bowlers");
  // List<Map<dynamic, dynamic>> lists = [];
  Map<String, int> temp = new Map();

  List finalTeam = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sort appbar"),
        ),
        body: ListView(
          children: [
            FutureBuilder(
                future: dbRef.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    // lists.clear();
                    temp.clear();
                    Map<dynamic, dynamic> batsman_values = snapshot.data.value;
                    // values.forEach((key, values) {
                    // lists.add(values);
                    // });
                    batsman_values.forEach((key, values) {
                      if (batsman_list.contains(key)) {
                        temp[key] = values["runs"];
                      }
                    });
                    SplayTreeMap<String, int> batsman_sorted_map =
                        SplayTreeMap.from(temp,
                            (key1, key2) => temp[key2].compareTo(temp[key1]));

                    for (int i = 0; i < 3; i++) {
                      finalTeam.add(batsman_sorted_map.keys.elementAt(i));
                    }
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(batsman_values.toString()),
                          Text(""),
                          Text(temp.toString()),
                          Text(""),
                          Text(batsman_sorted_map.toString()),
                          Text(""),
                          Text(batsman_list.toString()),
                          Text(""),
                          Text(finalTeam.toString()),
                          // Text("Name: " + player_name),
                          // Text("No. of matches played: " +
                          //     values[player_name]["matches"].toString()),
                          // Text("Total runs: " +
                          //     values[player_name]["runs"].toString()),
                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
            Text("bowler"),
            FutureBuilder(
                future: dbRef2.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    // lists.clear();
                    temp.clear();
                    Map<dynamic, dynamic> bowler_values = snapshot.data.value;
                    // values.forEach((key, values) {
                    // lists.add(values);
                    // // });
                    bowler_values.forEach((key, values) {
                      if (bowler_list.contains(key)) {
                        temp[key] = values["wickets"];
                      }
                    });
                    SplayTreeMap<String, int> bowler_sorted_map =
                        SplayTreeMap.from(temp,
                            (key1, key2) => temp[key2].compareTo(temp[key1]));
                    for (int i = 0; i < 2; i++) {
                      finalTeam.add(bowler_sorted_map.keys.elementAt(i));
                    }
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(bowler_values.toString()),
                          Text(""),
                          Text(temp.toString()),
                          Text(""),
                          Text(bowler_sorted_map.toString()),
                          Text(""),
                          Text(bowler_list.toString()),
                          Text(""),
                          Text(finalTeam.toString()),
                          // Text("Name: " + player_name),
                          // Text("No. of matches played: " +
                          //     values[player_name]["matches"].toString()),
                          // Text("Total runs: " +
                          //     values[player_name]["runs"].toString()),
                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
            Text("........"),
            Text(finalTeam.toString()),
            FutureBuilder(
                future: dbRef2.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  return Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        // return Text(
                        //     index.toString() + " " + finalTeam.toString());
                        return Text(index.toString() + " " + finalTeam[index]);
                      },
                    ),
                  );
                })
          ],
        ));
  }
}
