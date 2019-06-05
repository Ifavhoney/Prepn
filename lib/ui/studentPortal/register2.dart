import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:prepn/data/main.dart' as data;
import 'package:intl/intl.dart';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
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

class _Register2State extends State<Register2> {
  //Dropdown schools
  String selectedSchool = "";

  //default radioValue
  int radioValue = -1;

  //Snackbar success
  final SnackBar successBar = SnackBar(
      content: Text(
        "Validated Registration",
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.pinkAccent);

  final SnackBar radioBar = SnackBar(
      content: Text(
        "Off-Campus or On Campus?",
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.pinkAccent);

  Widget _radioResults(int value) {
    Widget formReturn;
    switch (value) {
      case 0:
        formReturn = TextFormField(
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "123 Yonge St",
            labelText: "Address",
          ),
          validator: (String value) {
            if (value.isEmpty && radioValue == 0) {
              return "Empty Field";
            }
          },
        );
        break;
      case 1:
        formReturn = Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "123 Yonge St",
                labelText: "School Residence Address",
              ),
              validator: (String value) {
                if (value.isEmpty && radioValue == 1) {
                  return "Empty Field";
                }
              },
            ),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "123A",
                labelText: "Room #",
              ),
              validator: (String value) {
                if (value.isEmpty && radioValue == 1) {
                  return "Empty Field";
                } else {
                  setState(() {
                    //Set info to value
                  });
                }
              },
            )
          ],
        );

        break;
    }

    return formReturn;
  }

  void onChanged(int value) {
    setState(() {
      switch (value) {
        case 0:
          this.radioValue = value;
          break;
        case 1:
          this.radioValue = value;
          break;
      }
    });
  }

  //Date
  TextEditingController dateValue = TextEditingController();
  Future _selectedDate(BuildContext context) async {
    //Date Range or isNull called showDatepicker method
    var dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 90),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    //if it's == to now or null, don't get data
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
          title: Text("Register2"),
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
                            "College Info",
                            style: Theme.of(context).textTheme.headline,
                          ),
                          Card(
                              margin: EdgeInsets.all(30),
                              color: Colors.grey.shade300,
                              child: Column(
                                children: <Widget>[
                                  //DropDownList
                                  //create formfield

                                  DropDownField(
                                    value: "",
                                    icon: Icon(Icons.check_box),
                                    labelText: "School",
                                    labelStyle:
                                        TextStyle(color: Colors.pink.shade200),
                                    items: data.schools,
                                    strict: false,
                                    setter: (dynamic newValue) {
                                      selectedSchool = newValue;
                                    },
                                    required: true,
                                  ),

                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        labelText: "Student Number",
                                        hintText: "300848224"),
                                    inputFormatters: [
                                      //keyboard will only show numbers
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Not a valid student number';
                                      }
                                    },
                                  ),
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
                                          labelText: "Graduation Year",
                                          hintText: "11/20/2022",
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
                                ],
                              )),
                          Text(
                            "Other",
                            style: Theme.of(context).textTheme.headline,
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Card(
                                margin: EdgeInsets.all(30),
                                color: Colors.grey.shade300,
                                child: Row(
                                  children: <Widget>[
                                    //Off campus radioButton
                                    Text("I Live\nOff-Campus"),
                                    Radio(
                                      value: 0,
                                      groupValue: this.radioValue,
                                      onChanged: this.onChanged,
                                    ),
                                    Text("I Live\nOn Campus"),
                                    Radio(
                                      value: 1,
                                      groupValue: this.radioValue,
                                      onChanged: onChanged,
                                    ),
                                  ],
                                )),
                          ),
                          ListTile(title: _radioResults(this.radioValue)),
                          RaisedButton(
                            child: Text(
                              "Next",
                              style: Theme.of(context).textTheme.button,
                            ),
                            onPressed: () {
                              if (this.radioValue == -1) {
                                Scaffold.of(context).showSnackBar(radioBar);
                              } else if (this.radioValue > -1 &&
                                  _formKey.currentState.validate()) {
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
