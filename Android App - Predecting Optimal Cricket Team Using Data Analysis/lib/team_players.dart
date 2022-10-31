import 'dart:ui';

import 'package:edi2/fetch_data.dart';
import 'package:flutter/material.dart';

class TeamPlayer extends StatefulWidget {
  TeamPlayer(this.batsman_list, this.wicketkeeper_list, this.allrounder_list,
      this.bowler_list);
  final List<String> batsman_list;
  final List<String> wicketkeeper_list;
  final List<String> allrounder_list;
  final List<String> bowler_list;

  @override
  _TeamPlayerState createState() => _TeamPlayerState(
        this.batsman_list,
        this.wicketkeeper_list,
        this.allrounder_list,
        this.bowler_list,
      );
}

class _TeamPlayerState extends State<TeamPlayer> {
  List<String> batsman_list;
  List<String> wicketkeeper_list;
  List<String> allrounder_list;
  List<String> bowler_list;

  _TeamPlayerState(this.batsman_list, this.wicketkeeper_list,
      this.allrounder_list, this.bowler_list);
  @override
  Widget build(BuildContext context) {
    // return Text(
    //   "shyam",
    //   style: TextStyle(color: Colors.red),
    // );
    return Expanded(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: batsman_list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white24,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            child: Image.asset('assets/player2.png')),
                        title: Text(
                          batsman_list[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Batsman",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FetchData(
                                      batsman_list[index], "batsman")));
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  );
                }),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: wicketkeeper_list.length,
                itemBuilder: (context, index) {
                  // return Text(batsman_list[index]);
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white24,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            child: Image.asset('assets/player2.png')),
                        title: Text(
                          wicketkeeper_list[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Wicket-Keeper",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FetchData(
                                      wicketkeeper_list[index],
                                      "wicket-keeper")));
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  );
                }),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allrounder_list.length,
                itemBuilder: (context, index) {
                  // return Text(batsman_list[index]);
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white24,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            child: Image.asset('assets/player2.png')),
                        title: Text(
                          allrounder_list[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" All Rounder",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FetchData(
                                      allrounder_list[index], "allrounder")));
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  );
                }),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bowler_list.length,
                itemBuilder: (context, index) {
                  // return Text(batsman_list[index]);
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.white24,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 1.0, color: Colors.black))),
                            child: Image.asset('assets/player2.png')),
                        title: Text(
                          bowler_list[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Bowler",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FetchData(bowler_list[index], "bowler")));
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      )
                    ],
                  );
                }),
            // ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: bowler_list.length,
            //     itemBuilder: (context, index) {
            //       // return Text(batsman_list[index]);
            //       return Card(
            //         child: ListTile(
            //           leading: Text(bowler_list[index]),
            //           subtitle: Text("Bowler"),
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => FetchData(
            //                         bowler_list[index], "bowler")));
            //           },
            //         ),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
