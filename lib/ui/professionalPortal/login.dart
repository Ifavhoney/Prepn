import 'package:flutter/material.dart';
import 'register.dart';
import 'package:prepn/ui/foodPortal/mealTypes.dart';

//Private class for login
class _Info {
  String username = "";
  String password = "";

  _Info();
  //TO DO GET SET
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Methods
  Future _toMealTypes(BuildContext context) async {
    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext context) {
      return MealTypes();
    });
    return Navigator.of(context).push(route);
  }

  Future _toRegister(BuildContext context) async {
    //Create Route
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return Register();
    });

    //Call Navigator
    Future val = Navigator.of(context).push(route);
    return val;
  }

  //class login
  _Info user = _Info();
  //Form key
  final _formKey = GlobalKey<FormState>();

  //Snackbar success
  final SnackBar successBar = SnackBar(
      content: Text(
        "Validated Username and pass",
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.pinkAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Login"),
        actions: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            child: Text(" Prep'n"),
          )
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Builder(
        builder: (context) => Container(
                child: Form(
              //Key for validation etc
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Prepn@customerservice",
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Empty Field";
                      } else {
                        setState(() {
                          //Set info to value
                          user.username = value;
                        });
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextFormField(
                      autofocus: true,
                      //Shows next instead
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      decoration: InputDecoration(
                          //  icon: Icon(Icons.border_color),
                          prefixIcon: Icon(Icons.border_color),
                          hintText: "Prepn!",
                          labelText: "Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Empty field";
                        } else {
                          setState(() {
                            user.password = value;
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontSize: 30),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _toMealTypes(context);
                            Scaffold.of(context).showSnackBar(successBar);
                          }
                        },
                      )),
                  Container(
                    //color: Colors.yellow,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: FittedBox(
                        child: Text(
                      "OR",
                      style: Theme.of(context).textTheme.headline,
                    )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontSize: 30),
                        ),
                        onPressed: () {
                          print("hello");
                          _toRegister(context);
                        },
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
