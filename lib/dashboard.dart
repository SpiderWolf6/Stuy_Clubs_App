import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/constant.dart';
import 'card-list-tile.dart';
import 'club-profile.dart';
import 'api/firebase_api.dart';
import 'api/python_api.dart';
import 'account-page.dart';

class CardDetail {
  String title;
  String subtitle;

  CardDetail({required this.title, required this.subtitle});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<CardDetail> cards = [
    CardDetail(title: 'SMC', subtitle: 'Medium'),
    CardDetail(title: 'Socio Political', subtitle: 'Low'),
    CardDetail(title: 'Key Club', subtitle: 'Low'),
    CardDetail(title: 'Model UN Club', subtitle: 'Low'),
  ];

  final List<Widget> modes = <Widget>[
    Text('Light'),
    Text('Dark'),
  ];

  final List<bool> _selectedMode = <bool>[false, true];
  String selected = "Light";
  var bg = Color.fromRGBO(58, 66, 86, 1.0);
  List<CardDetail> testing = [];
  String url = '';
  var data;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.displayName! + "'s Dashboard"),
        centerTitle: false,
        backgroundColor: Colors.red[200],
        actions: [
          TextButton(
            child: Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountLayout()
                )
              );
            },
          )
        ],
      ),
      backgroundColor: bg,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedMode.length; i++) {
                        _selectedMode[i] = i == index;
                      print(_selectedMode);
                      print(index);
                      if (index == 0) {
                        bg = Color.fromRGBO(210, 212, 218, 1);
                      }
                      else {
                        bg = Color.fromRGBO(58, 66, 86, 1.0);
                      }
                      }
                  });
                },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                children: modes, 
                isSelected: _selectedMode
                ),
                ElevatedButton(
                  child: Text('Sign Out'),
                  onPressed: () async {
                    url = "http://192.168.1.170:5001/stuyactivities";
                    print(url);
                    data = await fetchData(url);
                    print(data);
                    // cards.add(CardDetail(title: "Hello", subtitle:"xyz"));
                    // print(cards);
                    // CardListTile(cards);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}