import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  FetchData(this.player_name, this.player_type);
  final String player_name;
  final String player_type;
  @override
  _FetchDataState createState() =>
      _FetchDataState(this.player_name, this.player_type);
}

class _FetchDataState extends State<FetchData> {
  final String player_name;
  final String player_type;
  String name = "BATSMAN";
  _FetchDataState(this.player_name, this.player_type);
  final dbRef_batsman = FirebaseDatabase.instance.reference().child("batsman");
  final dbRef_wicketkeeper =
      FirebaseDatabase.instance.reference().child("wicketkeeper");

  final dbRef_allrounder =
      FirebaseDatabase.instance.reference().child("allrounder");
  final dbRef_bowler = FirebaseDatabase.instance.reference().child("bowler");

  // List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players Detail"),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.brown,
              child: Image.asset(
                'assets/crick4.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 500,
                    child: Image.asset(
                      'assets/crick3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            child: Image.asset('assets/player2.png'),
                          ),
                          Padding(padding: EdgeInsets.only(right: 25)),
                          Text(player_name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: FutureBuilder(
                    future: Future.wait([
                      dbRef_batsman.once(),
                      dbRef_wicketkeeper.once(),
                      dbRef_allrounder.once(),
                      dbRef_bowler.once()
                    ]),
                    builder:
                        (context, AsyncSnapshot<List<DataSnapshot>> snapshot) {
                      if (snapshot.hasData) {
                        if (player_type == "batsman") {
                          List<String> attributes_batsman = [
                            "Inns",
                            "Mat",
                            "50",
                            "100",
                            "4s",
                            "6s",
                            "HS",
                            "runs",
                            "sr",
                            "Avg",
                            "BF",
                            "Time on pitch",
                            "Hard_Hitting_Ability",
                            "Consistency",
                            "Finisher",
                          ];
                          Map<dynamic, dynamic> batsman_values =
                              snapshot.data[0].value;
                          print(batsman_values.toString());
                          return Expanded(
                              child: SingleChildScrollView(
                            physics: ScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: attributes_batsman.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, right: 2),
                                            child: ListTile(
                                              tileColor: Colors.white24,
                                              title: Text(
                                                attributes_batsman[index] +
                                                    ": " +
                                                    batsman_values[player_name][
                                                            attributes_batsman[
                                                                index]]
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ));
                          // return Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: <Widget>[
                          //     // Text(values1.toString()),
                          //     // Text(""),
                          //     Text("Name: " + player_name),
                          //     Text("Type: " + player_type),
                          //     Text("No. of matches played: " +
                          //         batsman_values[player_name]["matches"].toString()),
                          //     Text("Total runs: " +
                          //         batsman_values[player_name]["runs"].toString()),
                          //   ],
                          // );
                        } else if (player_type == "bowler") {
                          Map<dynamic, dynamic> values2 =
                              snapshot.data[1].value;
                          print(values2.toString());
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text(values2.toString()),
                              // Text(""),
                              Text("Name: " + player_name),
                              Text("Type: " + player_type),
                              Text("No. of matches played: " +
                                  values2[player_name]["matches"].toString()),
                              Text("Total wickets: " +
                                  values2[player_name]["wickets"].toString()),
                            ],
                          );
                        }
                        // return new ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: values.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Card(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             Text("Name: " + values.toString()),
                        //             Text("Name: " + lists.toString()),
                        //             Text("Name: " + values["a"]["name"].toString()),
                        //             // Text("Age: " + lists[index]["name"].toString()),
                        //             // Text("Name: " + lists[index]["age"].toString()),
                        //           ],
                        //         ),
                        //       );
                        //     });
                      }
                      return CircularProgressIndicator();
                    }),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
