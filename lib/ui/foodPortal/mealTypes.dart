import 'package:flutter/material.dart';
import 'package:prepn/ui/foodPortal/breakfast/FoodOptions.dart';

class MealTypes extends StatelessWidget {
  //Food Options
  final TextStyle soonTXT = TextStyle(color: Colors.black, fontSize: 20);

  //Methods
  Future _toFoodOptions(BuildContext context) async {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext context) {
      return FoodOptions();
    });
    return Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Meal"),
        actions: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            child: Text("Prep'n"),
          )
        ],
      ),
      backgroundColor: Colors.blue.shade100,
      body: Container(
        child: Stack(
          children: <Widget>[
            //IN PROGRESS

            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: RaisedButton(
                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Text(
                      "Breakfast",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: () {
                      _toFoodOptions(context);
                    },
                  ),
                ),
              ),
            ),

            //IN PROGRESS

            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.cyan.shade100),
                      child: Text(
                        "COMING SOON",
                        style: soonTXT,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(0),
                              child: ButtonTheme(
                                minWidth: 5,
                                height: 5,
                                child: RaisedButton(
                                  color: Colors.red.shade600,

                                  //  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Lunch",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.all(0),
                              child: ButtonTheme(
                                minWidth: 5,
                                height: 5,
                                child: RaisedButton(
                                  color: Colors.brown.shade300,
                                  //padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Dinner",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                  onPressed: () {},
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
