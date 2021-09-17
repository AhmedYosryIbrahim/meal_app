import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/Faviourit_screen.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TapScreen extends StatefulWidget {
  final List favoriteMeal;
  const TapScreen(this.favoriteMeal);
  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  List _pages ;
  int _selectedPageIndex = 0;
@override
  void initState() {
   _pages = [
     {'page': CategoryScreen(), 'title': 'Categories'},
     {'page': FavoritesScreen(widget.favoriteMeal), 'title': 'Favorites'}
   ];
    super.initState();
  }
  void _selctedpage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selctedpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
