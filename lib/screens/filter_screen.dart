import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final routeName = '/filters';
  final Function saveFilter;
  final Map CurrentFilter;

  const FilterScreen( this.CurrentFilter,this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;
  @override
  initSatate(){
     _isGlutenFree = widget.CurrentFilter['Gluten'];
     _isLactoseFree =  widget.CurrentFilter['Lactose'];
     _isVegan =  widget.CurrentFilter['Vegan'];
     _isVegetarian =  widget.CurrentFilter['Vegetarian'];
    super.initState();
  }
  Widget SwitchList(
      String title, String subtitle, bool value, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your filter"), actions: [
          IconButton(onPressed: (){
            final Map SelectedFilter ={
              'Gluten' : _isGlutenFree,
              'Lactose' : _isLactoseFree,
              'Vegan' : _isVegan,
              'Vegetarian' : _isVegetarian
            } ;
            widget.saveFilter(SelectedFilter);
          }, icon: Icon(Icons.save))
      ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchList(
                  "GlutenFree", 'Only include Gluten free meal', _isGlutenFree,
                  (value) {
                setState(
                  () {
                    _isGlutenFree = value;
                  },
                );
              }),
              SwitchList(
                  "Lactose Free", 'Only include Lactose Free meal', _isLactoseFree,
                      (value) {
                    setState(
                          () {
                        _isLactoseFree = value;
                      },
                    );
                  }),
              SwitchList(
                  "Vegan", 'Only include Vegan meal', _isVegan,
                      (value) {
                    setState(
                          () {
                        _isVegan = value;
                      },
                    );
                  }),
              SwitchList(
                  "Vegetarian", 'Only include Vegetarian meal', _isVegetarian,
                      (value) {
                    setState(
                          () {
                        _isVegetarian = value;
                      },
                    );
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
