import 'package:flutter/material.dart';
import 'register2.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _InfoPro {
  String email;
  String password;
  String birthday;
  String phoneNumber;
  String address;

  _InfoPro();

  //TO DO GET SET

}

class _RegisterState extends State<Register> {
  //Routing
  Future _toRegister(BuildContext context) async {
    //Create route
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return Register2();
    });

    //Call Navigator
    Future val = Navigator.of(context).push(route);
    return val;
  }

  //Validation
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  //Snackbar success
  final SnackBar successBar = SnackBar(
      content: Text(
        "Validated Registration",
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.pinkAccent);

  //Date
  TextEditingController dateValue = TextEditingController();
  Future _selectedDate(BuildContext context) async {
    //Date Range or isNull
    var dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 90),
      lastDate: DateTime.now(),
    );
    if (dt != null && dt != DateTime.now()) {
      dateValue.text = DateFormat.yMd().format(dt).toString();
    }
  }

  //class _InfoPro
  _InfoPro user = _InfoPro();
  //Form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
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
              alignment: Alignment.center,
              child: Form(
                  //\validates real time
                  //autovalidate: true,
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Login Info",
                            style: Theme.of(context).textTheme.headline,
                          ),
                          Card(
                              margin: EdgeInsets.all(30),
                              color: Colors.grey.shade300,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    autofocus: true,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.alternate_email),
                                      labelText: "Email",
                                      hintText: "prepn@customerservice.com",
                                    ),
                                    validator: (String value) {
                                      if (value.isEmpty ||
                                          isValidEmail(value) == false) {
                                        return "Not a valid Email";
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.border_color),
                                        labelText: "Password",
                                        hintText: "Prepn!!"),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return "Not a valid Password";
                                      }
                                    },
                                  ),
                                ],
                              )),
                          Text(
                            "Other",
                            style: Theme.of(context).textTheme.headline,
                          ),
                          Card(
                              margin: EdgeInsets.all(30),
                              color: Colors.grey.shade300,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: "Full Name",
                                          hintText: "Prepee The Mascot"),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Not a valid full name";
                                        }
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(30)
                                      ]),
                                  InkWell(
                                    onTap: () {
                                      //tap lets use DateTime & showDatePicker
                                      _selectedDate(context);
                                    },
                                    //invisible to hit testing
                                    child: IgnorePointer(
                                      child: TextFormField(
                                        controller: dateValue,
                                        keyboardType: TextInputType.datetime,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.cake),
                                          labelText: "Birthday",
                                          hintText: "11/20/1990",
                                        ),
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Not a valid Date';
                                          }
                                        },

                                        //     onSaved: context,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.chat),
                                        labelText: "Phone Number",
                                        hintText: "64787920001"),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      //keyboard will only show numbers
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Not a valid phone number';
                                      }
                                    },
                                  ),
                                ],
                              )),
                          RaisedButton(
                            child: Text(
                              "Next",
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _toRegister(context);
                                Scaffold.of(context).showSnackBar(successBar);
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ))),
        ));
  }
}
