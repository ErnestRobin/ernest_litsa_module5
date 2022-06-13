import 'package:ernest_litsa_module5/adduser.dart';
import 'package:ernest_litsa_module5/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _GoaltruckerAppState createState() => _GoaltruckerAppState();
}

class _GoaltruckerAppState extends State<Home> {
  Widget _currentWidget = Container();

  var _currentIndex = 0;

  Widget _homeScreen() {
    return Container(
      child: ListView(children: const []),
    );
  }

  Widget _profileScreen() {
    return Container(
        child: const Scaffold(
      body: Card(elevation: 16, child: Text('hello')),
    ));
  }

  Widget _settingsScreen() {
    return Container(
      color: Colors.red,
    );
  }

  @override
  void initState() {
    initState();
    _loadScreen();
  }

  void _loadScreen() {
    switch (_currentIndex) {
      case 0:
        return setState(() => _currentWidget = _homeScreen());
      case 1:
        return setState(() => _currentWidget = _profileScreen());
      case 2:
        return setState(() => _currentWidget = _settingsScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GoalTrucker"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: _currentWidget,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4.0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _loadScreen();
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          const AddUser();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const AddUser()));
        }));
  }
}
