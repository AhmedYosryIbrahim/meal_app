import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/tap_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _Filters = {
    'Gluten' : false,
    'Lactose' : false,
    'Vegan' : false ,
    'Vegetarian' : false
  };
  List <Meal> _avilableMeal = DUMMY_MEALS;
  List <Meal> _favoriteMeal = [];

  void _setFilters (Map _FiltersData){
    setState(() {
      _Filters = _FiltersData;

      _avilableMeal=DUMMY_MEALS.where((meal){
        if(_Filters['Gluten'] && !meal.isGlutenFree){
          return false ;
        }
        if(_Filters['Lactose'] && !meal.isLactoseFree){
          return false ;
        }if(_Filters['Vegan'] && !meal.isVegan){
          return false ;
        }if(_Filters['Vegetarian'] && !meal.isVegetarian){
          return false ;
        }
        return true ;
      }).toList();
    });
  }
  void _favoriteItem (String mealId){
    final ItemIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if(ItemIndex >= 0){
      setState(() {
        _favoriteMeal.removeAt(ItemIndex);
      });
    }else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool _isMealFavorite (String mealId){
    return _favoriteMeal.any((meal) => meal.id == mealId) ;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      //home: MyHomePage(),
      routes: {
        '/' :(context) =>TapScreen(_favoriteMeal),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_avilableMeal),
        MealDetailScreen.routeName : (context) => MealDetailScreen(_favoriteItem , _isMealFavorite),
        FilterScreen.routeName : (context) => FilterScreen(_Filters,_setFilters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
