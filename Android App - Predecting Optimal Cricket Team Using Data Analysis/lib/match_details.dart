import 'package:edi2/fetch_data.dart';
import 'package:edi2/finalTeam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatefulWidget {
  MatchDetails(this.batsman_list, this.bowler_list, this.wicketkeeper_list,
      this.allrounder_list, this.match_name);
  final List<String> batsman_list;
  final List<String> bowler_list;
  final List<String> wicketkeeper_list;
  final List<String> allrounder_list;
  final String match_name;
  @override
  _MatchDetailsState createState() => _MatchDetailsState(
      this.batsman_list,
      this.bowler_list,
      this.wicketkeeper_list,
      this.allrounder_list,
      this.match_name);
}

class _MatchDetailsState extends State<MatchDetails> {
  List<String> batsman_list;
  List<String> bowler_list;
  List<String> wicketkeeper_list;
  List<String> allrounder_list;
  String match_name;
  String stadium = "bangalore";
  // Map<String, List<int>> stadiumlist = {
  //   "bangalore": [6, 1, 2, 3],
  //   "chennai": [4, 1, 2, 4],
  //   "mumbai": [6, 0, 2, 4]
  // };
  _MatchDetailsState(
    this.batsman_list,
    this.bowler_list,
    this.wicketkeeper_list,
    this.allrounder_list,
    this.match_name,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(match_name),
        elevation: 20,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.brown,
              child: Image.asset(
                'assets/crick3.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 2.0, bottom: 6.0, left: 8, right: 8),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: Card(
                        elevation: 50,
                        child: Image.asset(
                          'assets/ground.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          // child: Text(
                          //   "shyam",
                          //   style: TextStyle(color: Colors.white),
                          // ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Venue: " + stadium,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 30),
                              ),
                              RaisedButton(
                                child: Text(
                                  "Change Venue",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                color: Colors.teal[800],
                                onPressed: () => _onButtonPressed(),
                              ),
                            ],
                          )),
                    )
                    // Padding(
                    //     padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                    //     child: CupertinoButton.filled(
                    //         child: Text("Choose ground",
                    //             style: TextStyle(fontWeight: FontWeight.bold)),
                    //         onPressed: () => _onButtonPressed())),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        // Text("listview builder"),
                        // Text(stadium),
                        // Padding(
                        //     padding:
                        //         EdgeInsets.only(top: 10, left: 50, right: 50),
                        //     child: CupertinoButton.filled(
                        //         child: Text("Choose ground",
                        //             style:
                        //                 TextStyle(fontWeight: FontWeight.bold)),
                        //         onPressed: () => _onButtonPressed())),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: batsman_list.length,
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
                                                    width: 1.0,
                                                    color: Colors.black))),
                                        child:
                                            Image.asset('assets/player2.png')),
                                    title: Text(
                                      batsman_list[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Icon(Icons.linear_scale,
                                            color: Colors.yellowAccent),
                                        Text(" Batsman",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FetchData(
                                                  batsman_list[index],
                                                  "batsman")));
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
                                                    width: 1.0,
                                                    color: Colors.black))),
                                        child:
                                            Image.asset('assets/player2.png')),
                                    title: Text(
                                      bowler_list[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Icon(Icons.linear_scale,
                                            color: Colors.yellowAccent),
                                        Text(" Bowler",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FetchData(
                                                  bowler_list[index],
                                                  "bowler")));
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
                                                    width: 1.0,
                                                    color: Colors.black))),
                                        child:
                                            Image.asset('assets/player2.png')),
                                    title: Text(
                                      wicketkeeper_list[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Icon(Icons.linear_scale,
                                            color: Colors.yellowAccent),
                                        Text(" Wicket-Keeper",
                                            style:
                                                TextStyle(color: Colors.white))
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
                                                    width: 1.0,
                                                    color: Colors.black))),
                                        child:
                                            Image.asset('assets/player2.png')),
                                    title: Text(
                                      allrounder_list[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Row(
                                      children: <Widget>[
                                        Icon(Icons.linear_scale,
                                            color: Colors.yellowAccent),
                                        Text(" All Rounder",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    trailing: Icon(Icons.keyboard_arrow_right,
                                        color: Colors.white, size: 30.0),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FetchData(
                                                  allrounder_list[index],
                                                  "allrounder")));
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
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        elevation: 400,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FinalTeam(
                      batsman_list,
                      bowler_list,
                      wicketkeeper_list,
                      allrounder_list,
                      stadium,
                      match_name)));
        },
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: [
        ListTile(
          title: Text("Bangalore stadium",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => _selectItem("bangalore"),
        ),
        ListTile(
          title: Text("Chennai stadium",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => _selectItem("chennai"),
        ),
        ListTile(
          title: Text("Mumbai stadium",
              style: TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => _selectItem("mumbai"),
        ),
      ],
    );
  }

  void _selectItem(String stad) async {
    Navigator.pop(context);
    setState(() {
      stadium = stad.toString();
    });
  }
}
