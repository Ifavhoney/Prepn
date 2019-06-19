import 'package:flutter/material.dart';
import 'package:prepn/data/main.dart' as data;
import 'package:prepn/ui/foodPortal/mealTypes.dart';

class FoodOptions extends StatefulWidget {
  @override
  _FoodOptionsState createState() => _FoodOptionsState();
}

class _FoodOptionsState extends State<FoodOptions> {
  //Method
  Future _toMealTypes(BuildContext context) async {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext context) {
      return MealTypes();
    });
    return Navigator.of(context).push(route);
  }

  //instances
  List<String> _selectedFoods = List();

  //Declare Map from data/main.dart
  Map<String, dynamic> food = data.food;

  int groupValue = -1;

  bool checkBoxValue = false;

  List<Widget> _addWidget = List();

  //methods
  void _onChanged(int value) {
    switch (value) {
      case -1:
        setState(() {
          this.groupValue = value;
        });
        break;

      case 0:
        setState(() {
          this.groupValue = value;
        });
        break;
      case 1:
        setState(() {
          this.groupValue = value;
        });
        break;

//All
      case 2:
        setState(() {
          this.groupValue = value;
        });
        break;
    }
  }

  Widget filterDiet(String name, int radio) {
    print(name);
    switch (radio) {
      case -1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                    _addWidget.map((showFoodIcons) => showFoodIcons).toList(),
              ),
            )
          ],
        );
        break;
    }
  }

  Widget _showFoodIcons(List _foodBreakfast, int position, String name,
      int diet, bool assemble, bool cook, int radio) {
    //Refresh
    _addWidget = [Text("")];

    switch (diet) {
      case 0:

        //for readable purposes (Can be improved)
        if (diet == 0) {
          _addWidget.add(Icon(Icons.spa));
        }
        if (assemble == true) {
          _addWidget.add(Icon(Icons.local_grocery_store));
        }

        if (cook == true) {
          _addWidget.add(Icon(Icons.whatshot));
        }

        // final item = _foodBreakfast.where((e) => e.isNotEmpty).toList();

        //  print(item[position]["name"]);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                    _addWidget.map((showFoodIcons) => showFoodIcons).toList(),
              ),
            )
          ],
        );

        break;
      case 1:

        //Adding to the List
        if (diet == 1) {
          _addWidget.add(Icon(Icons.cake));
        }
        if (assemble == true) {
          _addWidget.add(Icon(Icons.local_grocery_store));
        }

        if (cook == true) {
          _addWidget.add(Icon(Icons.whatshot));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                    _addWidget.map((showFoodIcons) => showFoodIcons).toList(),
              ),
            )
          ],
        );

        break;

      case 2:
        //for readable purposes (Can be improved)
        if (diet == 2) {
          _addWidget.add(Icon(Icons.room_service));
        }
        if (assemble == true) {
          _addWidget.add(Icon(Icons.local_grocery_store));
        }

        if (cook == true) {
          _addWidget.add(Icon(Icons.whatshot));
        }

        //We are copying and pasting this for the all option & maintaing the icons
        if (radio == -1) {
          return filterDiet(name, radio);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$name"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                    _addWidget.map((showFoodIcons) => showFoodIcons).toList(),
              ),
            )
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Inside Food is a List of type Map
    List<Map> _foodBreakfast = food["breakfast"];
    List item;
    if (this.groupValue == -1) {
      item = _foodBreakfast.where((e) => e.isNotEmpty).toList();
    }
    if (this.groupValue == 0) {
      item = _foodBreakfast.where((e) => e["diet"] == 0).toList();
    }
    if (this.groupValue == 1) {
      item = _foodBreakfast.where((e) => e["diet"] == 1).toList();
    }
    if (this.groupValue == 2) {
      item = _foodBreakfast.where((e) => e["diet"] == 2).toList();
    }
    //print(item[1]["name"]);

    // final item = _foodBreakfastt.where((e) => e["diet"] == 2).toList;
    // print(item);
    // print(_foodBreakfast[5]["cook"]);
    //print(food["breakfast"].length);

    return Scaffold(
        appBar: AppBar(
          title: Text("Food Option"),
          actions: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              child: Text("Prep'n"),
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).cardColor,
            child: ListView(
              children: <Widget>[
                ListTile(
                    title: Text("Filter Box"),
                    subtitle: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: FittedBox(
                        child: Column(
                          children: <Widget>[
                            Text("Diet"),
                            Row(
                              children: <Widget>[
                                Container(
                                    width: 300,
                                    child: Divider(color: Colors.red)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("All"),
                                Radio(
                                  value: -1,
                                  groupValue: this.groupValue,
                                  onChanged: this._onChanged,
                                ),
                                Text("Meat*"),
                                Radio(
                                  value: 2,
                                  groupValue: this.groupValue,
                                  onChanged: this._onChanged,
                                ),
                                Text("Vegetarian"),
                                Radio(
                                  value: 1,
                                  groupValue: this.groupValue,
                                  onChanged: this._onChanged,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Vegan"),
                                Radio(
                                  value: 0,
                                  groupValue: this.groupValue,
                                  onChanged: this._onChanged,
                                ),
                              ],
                            )
                            /* 
                            Text("Ways To Prep"),
                              Row(
                              children: <Widget>[
                                Container(
                                    width: 300,
                                    child: Divider(color: Colors.red)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                    value: checkBoxValue,
                                    onChanged: _checkBoxOnChanged)
                              ],
                            ) */
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: Builder(
            builder: (context) => Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int position) {
                            return CheckboxListTile(
                              //true whenever contains name

                              value: _selectedFoods
                                  .contains(_foodBreakfast[position]["name"]),
                              title: _showFoodIcons(
                                  _foodBreakfast,
                                  position,
                                  item[position]["name"],
                                  item[position]["diet"],
                                  item[position]["assemble"],
                                  item[position]["cook"],
                                  this.groupValue),

                              onChanged: (bool selected) {
                                //by default value == true
                                if (selected == true) {
                                  setState(() {
                                    _selectedFoods
                                        .add(_foodBreakfast[position]["name"]);
                                  });
                                } else {
                                  setState(() {
                                    _selectedFoods.remove(
                                        _foodBreakfast[position]["name"]);
                                  });
                                }
                              },
                            );
                          },
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.fromLTRB(30, 5, 30, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //  mainAxisAlignment: m
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.person),
                                    Text("# Of Free Deliveries Left: 3")
                                  ],
                                )),
                                title: Container(
                                  alignment: Alignment.topRight,
                                  child: Text("Range"),
                                ),
                                subtitle: Container(
                                  child: Text("Cost: ~20"),
                                  alignment: Alignment.topRight,
                                ),
                              ),
                              ButtonTheme.bar(
                                child: ButtonBar(
                                  children: <Widget>[
                                    FlatButton(
                                      child: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        _toMealTypes(context);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.indigo),
                                      ),
                                      onPressed: () {},
                                    ),
                                    (RaisedButton(
                                      color: Colors.red,
                                      child: Text(
                                        "Order",
                                        style: TextStyle(color: Colors.indigo),
                                      ),
                                      onPressed: () {},
                                    ))
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                )));
  }
}
