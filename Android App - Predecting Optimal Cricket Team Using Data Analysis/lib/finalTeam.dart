import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FinalTeam extends StatefulWidget {
  FinalTeam(this.batsman_list, this.bowler_list, this.wicketkeeper_list,
      this.allrounder_list, this.stadium, this.match_name);
  final List batsman_list;
  final List bowler_list;
  final List wicketkeeper_list;
  final List allrounder_list;
  final String stadium;
  final String match_name;
  @override
  _FinalTeamState createState() => _FinalTeamState(
      this.batsman_list,
      this.bowler_list,
      this.wicketkeeper_list,
      this.allrounder_list,
      this.stadium,
      this.match_name);
}

class _FinalTeamState extends State<FinalTeam> {
  final List batsman_list;
  final List bowler_list;
  final List wicketkeeper_list;
  final List allrounder_list;
  final String stadium;
  final String match_name;
  Map<String, List<int>> stadiumlist = {
    "bangalore": [5, 1, 2, 3],
    "chennai": [4, 1, 2, 4],
    "mumbai": [5, 1, 3, 2]
  };
  _FinalTeamState(this.batsman_list, this.bowler_list, this.wicketkeeper_list,
      this.allrounder_list, this.stadium, this.match_name);
  final dbRef_batsman = FirebaseDatabase.instance.reference().child("batsman");
  final dbRef_bowler = FirebaseDatabase.instance.reference().child("bowler");
  final dbRef_wicketkeeper =
      FirebaseDatabase.instance.reference().child("wicketkeeper");
  final dbRef_allrounder =
      FirebaseDatabase.instance.reference().child("allrounder");

  Map<String, double> temp = new Map();
  List finalTeam = new List();
  Map<String, String> batting_result = {
    "bangalore": "Res_ben",
    "chennai": "Res_chen",
    "mumbai": "Res_mum"
  };
  Map<String, String> bowling_result = {
    "bangalore": "Res_ben",
    "chennai": "Res_chen",
    "mumbai": "Res_mum"
  };
  Map<String, String> wicketkeeping_result = {
    "bangalore": "Res_ben",
    "chennai": "Res_chen",
    "mumbai": "Res_mum"
  };
  Map<String, String> allrounder_result = {
    "bangalore": "Res_ben",
    "chennai": "Res_chen",
    "mumbai": "Res_mum"
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp.clear();
    finalTeam.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Team 11"),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.brown,
              child: Image.asset(
                'assets/greenground2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      // child: Card(
                      //   elevation: 50,
                      child: Image.asset(
                        'assets/ground.jpg',
                        fit: BoxFit.fill,
                      ),
                      // ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      // child: Padding(
                      //   padding: EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              match_name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Open Sans',
                                  fontSize: 40),
                            ),
                          ),
                          Text(
                            batsman_list.length.toString() +
                                " " +
                                wicketkeeper_list.length.toString() +
                                " " +
                                allrounder_list.length.toString() +
                                " " +
                                bowler_list.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text(
                              "Ground Name: " + stadium,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // )
                  ],
                ),
                FutureBuilder(
                  future: Future.wait([
                    dbRef_batsman.once(),
                    dbRef_bowler.once(),
                    dbRef_wicketkeeper.once(),
                    dbRef_allrounder.once()
                  ]),
                  builder:
                      (context, AsyncSnapshot<List<DataSnapshot>> snapshot) {
                    if (snapshot.hasData) {
                      Map<dynamic, dynamic> batsman_values =
                          snapshot.data[0].value;
                      print(batsman_values.toString());
                      Map<dynamic, dynamic> bowler_values =
                          snapshot.data[1].value;
                      print(bowler_values.toString());
                      Map<dynamic, dynamic> wicketkeeper_values =
                          snapshot.data[2].value;
                      print(wicketkeeper_values.toString());
                      Map<dynamic, dynamic> allrounder_values =
                          snapshot.data[3].value;
                      print(allrounder_values.toString());
                      batsman_values.forEach((key, values) {
                        if (batsman_list.contains(key)) {
                          // temp[key] = values["runs"];
                          temp[key] = values[batting_result[stadium]];
                        }
                      });
                      SplayTreeMap<String, double> batsman_sorted_map =
                          SplayTreeMap.from(temp,
                              (key1, key2) => temp[key2].compareTo(temp[key1]));
                      print("batsman vallues" + batsman_values.toString());
                      print("temp.values" + temp.toString());
                      print("batsman sorted" + batsman_sorted_map.toString());
                      temp.clear();

                      wicketkeeper_values.forEach((key, values) {
                        if (wicketkeeper_list.contains(key)) {
                          // temp[key] = values["wickets"];
                          temp[key] = values[wicketkeeping_result[stadium]];
                        }
                      });
                      SplayTreeMap<String, double> wicketkeeper_sorted_map =
                          SplayTreeMap.from(temp,
                              (key1, key2) => temp[key2].compareTo(temp[key1]));
                      print("wicketkeeper vallues" +
                          wicketkeeper_values.toString());
                      print("temp.values" + temp.toString());
                      print("wicketkeeper sorted" +
                          wicketkeeper_sorted_map.toString());
                      temp.clear();
                      allrounder_values.forEach((key, values) {
                        if (allrounder_list.contains(key)) {
                          // temp[key] = values["wickets"];
                          temp[key] = values[allrounder_result[stadium]];
                        }
                      });
                      SplayTreeMap<String, double> allrounder_sorted_map =
                          SplayTreeMap.from(temp,
                              (key1, key2) => temp[key2].compareTo(temp[key1]));
                      print(
                          "allrounder vallues" + allrounder_values.toString());
                      print("temp.values" + temp.toString());
                      print("allrounder sorted" +
                          allrounder_sorted_map.toString());
                      temp.clear();
                      bowler_values.forEach((key, values) {
                        if (bowler_list.contains(key)) {
                          // temp[key] = values["wickets"];
                          temp[key] = values[bowling_result[stadium]];
                        }
                      });
                      SplayTreeMap<String, double> bowler_sorted_map =
                          SplayTreeMap.from(temp,
                              (key1, key2) => temp[key2].compareTo(temp[key1]));
                      print("bowler vallues" + bowler_values.toString());
                      print("temp.values" + temp.toString());
                      print("bowler sorted" + bowler_sorted_map.toString());
                      temp.clear();
                      print(stadiumlist[stadium][0].toString() + "****");
                      for (int i = 0; i < stadiumlist[stadium][0]; i++) {
                        print("batsman" + i.toString());
                        finalTeam.add(batsman_sorted_map.keys.elementAt(i));
                      }
                      print(stadiumlist[stadium][1].toString() + "****");
                      for (int i = 0; i < stadiumlist[stadium][1]; i++) {
                        print("wicketkipper" + i.toString());
                        finalTeam
                            .add(wicketkeeper_sorted_map.keys.elementAt(i));
                      }
                      print(stadiumlist[stadium][2].toString() + "****");
                      for (int i = 0; i < stadiumlist[stadium][2]; i++) {
                        print("allrounder" + i.toString());
                        finalTeam.add(allrounder_sorted_map.keys.elementAt(i));
                      }
                      print(stadiumlist[stadium][3].toString() + "****");
                      for (int i = 0; i < stadiumlist[stadium][3]; i++) {
                        print("bowler" + i.toString());
                        finalTeam.add(bowler_sorted_map.keys.elementAt(i));
                      }
                      // print(batsman_sorted_map.length);
                      // print(wicketkeeper_sorted_map.length);
                      // print(allrounder_sorted_map.length);
                      // print(bowler_sorted_map.length);

                      return Expanded(
                          child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: finalTeam.length,
                                itemBuilder: (context, index) {
                                  String type = "";
                                  if (batsman_list.contains(finalTeam[index])) {
                                    type = "Batsman";
                                  } else if (wicketkeeper_list
                                      .contains(finalTeam[index])) {
                                    type = "Wicket Keeper";
                                  } else if (allrounder_list
                                      .contains(finalTeam[index])) {
                                    type = "All Rounder";
                                  } else if (bowler_list
                                      .contains(finalTeam[index])) {
                                    type = "Bowler";
                                  }
                                  return Column(
                                    children: [
                                      // Padding(padding: EdgeInsets.only(top: 2)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5, right: 5),
                                        child: ListTile(
                                          tileColor: Colors.white24,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 6.0),
                                          leading: Container(
                                              padding:
                                                  EdgeInsets.only(right: 5.0),
                                              decoration: new BoxDecoration(
                                                  border: new Border(
                                                      right: new BorderSide(
                                                          width: 1.0,
                                                          color:
                                                              Colors.black))),
                                              child: Image.asset(
                                                'assets/player2.png',
                                                width: 30,
                                              )),
                                          title: Text(
                                            (index + 1).toString() +
                                                ": " +
                                                finalTeam[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          subtitle: Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20)),
                                              Icon(Icons.linear_scale_outlined,
                                                  color: Colors.yellowAccent),
                                              Text(type,
                                                  style: TextStyle(
                                                      color: Colors.white60,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 20))
                                            ],
                                          ),
                                          trailing: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.black,
                                              size: 30.0),
                                        ),
                                      ),
                                      // Container(
                                      //   height: 1,
                                      //   color: Colors.black,
                                      // )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ));
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // body: ListView(
      //   children: [
      //     FutureBuilder(
      //       future: Future.wait([dbRef_batsman.once(), dbRef_bowler.once()]),
      //       builder: (context, AsyncSnapshot<List<DataSnapshot>> snapshot) {
      //         if (snapshot.hasData) {
      //           Map<dynamic, dynamic> batsman_values = snapshot.data[0].value;
      //           Map<dynamic, dynamic> bowler_values = snapshot.data[1].value;
      //           batsman_values.forEach((key, values) {
      //             if (batsman_list.contains(key)) {
      //               // temp[key] = values["runs"];
      //               temp[key] = values[batting_result[stadium]];
      //             }
      //           });
      //           SplayTreeMap<String, int> batsman_sorted_map =
      //               SplayTreeMap.from(temp,
      //                   (key1, key2) => temp[key2].compareTo(temp[key1]));
      //           temp.clear();
      //           bowler_values.forEach((key, values) {
      //             if (bowler_list.contains(key)) {
      //               // temp[key] = values["wickets"];
      //               temp[key] = values[bowling_result[stadium]];
      //             }
      //           });
      //           SplayTreeMap<String, int> bowler_sorted_map =
      //               SplayTreeMap.from(temp,
      //                   (key1, key2) => temp[key2].compareTo(temp[key1]));

      //           for (int i = 0; i < stadiumlist[0]; i++) {
      //             finalTeam.add(batsman_sorted_map.keys.elementAt(i));
      //           }
      //           for (int i = 0; i < stadiumlist[1]; i++) {
      //             finalTeam.add(bowler_sorted_map.keys.elementAt(i));
      //           }
      //           return Card(
      //             child: Column(
      //               children: [
      //                 Text("stadium: " + stadium),
      //                 Text("batsman in sorted: " +
      //                     batsman_sorted_map.toString()),
      //                 Text("bowler in sorted: " +
      //                     bowler_sorted_map.toString()),
      //                 Text("......"),
      //                 Text(finalTeam.toString()),
      //                 Container(
      //                   height: 600,
      //                   child: ListView.builder(
      //                       itemCount: finalTeam.length,
      //                       itemBuilder: (context, index) {
      //                         return Text((index + 1).toString() +
      //                             ": " +
      //                             finalTeam[index]);
      //                       }),
      //                 )
      //               ],
      //             ),
      //           );
      //         }
      //         return CircularProgressIndicator();
      //       },
      //     )
      //   ],
      // )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
