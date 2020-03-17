import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rush/page/home_page.dart';
import 'package:flutter_rush/page/type_page.dart';
import 'package:flutter_rush/provide/tree_model_provider.dart';
import 'package:flutter_rush/page/mine.dart';
import 'package:flutter_rush/page/save.dart';
import 'package:flutter_rush/page/login.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigationWidget> {
  var _currentIndex = 0;
  final List<Widget> _list = <Widget>[
    MyHomePage(),
    ChangeNotifierProvider<TreeModelProvider>(
      create: (BuildContext context) => TreeModelProvider(),
      child: TypePage(),
    ),

    Login(),
    //SaveWidget(),
    MinePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalUtils.init(context);

    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: this._currentIndex,
        children: this._list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35.0,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                'HOME',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              title: Text(
                'EMAIL',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
              ),
              title: Text(
                'PAGES',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.adjust,
              ),
              title: Text(
                'Login',
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
