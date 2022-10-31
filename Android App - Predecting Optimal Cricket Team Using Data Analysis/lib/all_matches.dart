import 'package:edi2/match_details.dart';
import 'package:edi2/twoteamsmatch_details.dart';
import 'package:flutter/material.dart';

class MatchesHomePage extends StatefulWidget {
  @override
  _MatchesHomePageState createState() => _MatchesHomePageState();
}

class _MatchesHomePageState extends State<MatchesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(
          "All Matches list",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.brown,
              child: Image.asset(
                'assets/crick2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.white30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      side: BorderSide(width: 50, color: Colors.red)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right:
                                new BorderSide(width: 1.0, color: Colors.red))),
                    child: Icon(
                      Icons.sports_cricket_sharp,
                      // color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    "First Match",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Text(" Intermediate",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MatchDetails([
                                  "Virat Kohli",
                                  "Virendra Sehwag",
                                  "Shreyas Iyer",
                                  "Shikhar Dhawan",
                                  "Sanju Samson",
                                  "Rohit Sharma",
                                  "Robin Uthappa",
                                  "Murali Vijay",
                                  "KL Rahul",
                                  "Ambati Rayudu"
                                ], [
                                  "Jasprit Bumrah",
                                  "Mohammad Shami",
                                  "Yuzvendra Chahal",
                                  "Shreyas Gopal",
                                  "Mohit Sharma",
                                  "Kuldeep Yadav",
                                  "Ishant Sharma",
                                  "Harbhajan Singh",
                                  "Deepak Chahar",
                                ], [
                                  "MS Dhoni",
                                  "Rishabh Pant",
                                  "Parthiv Patel",
                                  "Dinesh Karthik"
                                ], [
                                  "Axar Patel",
                                  "Harbhajan Singh",
                                  "Hardik Pandya",
                                  "Ravindra Jadeja",
                                  "Suresh Raina",
                                  "Yuvraj Singh"
                                ], "First Match")));
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ListTile(
                  tileColor: Colors.white30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      side: BorderSide(width: 50, color: Colors.red)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right:
                                new BorderSide(width: 1.0, color: Colors.red))),
                    child: Icon(
                      Icons.sports_cricket_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    "Second Match",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Text(" Intermediate",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TwoTeamsMatch([
                                  "Virat Kohli",
                                  "Chris Lynn",
                                  "Kevin Pietersen",
                                  "Manan Vohra",
                                  "JP Duminy"
                                ], [
                                  "Naman Ojha",
                                ], [
                                  "Axar Patel",
                                  "Hardik Pandya",
                                ], [
                                  "Lakshmipathy Balaji",
                                  "Sunil Narine",
                                  "Kagiso Rabada",
                                ], [
                                  "Rohit Sharma",
                                  "Kane Williamson",
                                  "David Miller",
                                  "Ravi Bopara",
                                  "Cameron White"
                                ], [
                                  "Jos Buttler",
                                ], [
                                  "Krunal Pandya",
                                  "Kieron Pollard"
                                ], [
                                  "Lasith Malinga",
                                  "Rashid Khan",
                                  "Harbhajan Singh",
                                ], "Second Match")));
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ListTile(
                  tileColor: Colors.white30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      side: BorderSide(width: 50, color: Colors.red)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right:
                                new BorderSide(width: 1.0, color: Colors.red))),
                    child: Icon(
                      Icons.sports_cricket_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    "Third Match",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Text(" Intermediate",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TwoTeamsMatch([
                                  "David Warner",
                                  "Shaun Marsh",
                                  "Brad Hodge",
                                  "Subramaniam Badrinath",
                                  "Gautam Gambhir"
                                ], [
                                  "Robin Uthappa",
                                ], [
                                  "Yuvraj Singh",
                                  "Angelo Mathews",
                                ], [
                                  "Jofra Archer",
                                  "Sandeep Sharma",
                                  "Pravin Tambe",
                                ], [
                                  "Chris Gayle",
                                  "Virender Sehwag",
                                  "Andrew Symonds",
                                  "Ross Taylor",
                                  "Kedar Jadhav"
                                ], [
                                  "Dinesh Karthik",
                                ], [
                                  "Andre Russell",
                                  "Yusuf Pathan"
                                ], [
                                  "Dale Steyn",
                                  "Ravichandran Ashwin",
                                  "Zaheer Khan",
                                ], "Third Match")));
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ListTile(
                  tileColor: Colors.white30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      side: BorderSide(width: 50, color: Colors.red)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right:
                                new BorderSide(width: 1.0, color: Colors.red))),
                    child: Icon(
                      Icons.sports_cricket_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    "Fourth Match",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.yellowAccent),
                      Text(" Intermediate",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Colors.white, size: 30.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MatchDetails([
                                  "virat kohli",
                                  "dhoni",
                                  "Chris Gayle",
                                  "david warner",
                                  "rohit sharma"
                                ], [
                                  "bhumrah",
                                  "shami",
                                  "sam curran",
                                  "cummins"
                                ], [
                                  "MS Dhoni",
                                  "Rishabh Pant",
                                  "Parthiv Patel",
                                  "Dinesh Karthik"
                                ], [
                                  "Axar Patel",
                                  "Harbhajan Singh",
                                  "Hardik Pandya",
                                  "Ravindra Jadeja",
                                  "Suresh Raina",
                                  "Yuvraj Singh"
                                ], "Fourth Match")));
                  },
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
