import 'package:flutter/material.dart';
import 'package:prepn/ui/studentPortal/login.dart' as student;
import 'package:prepn/ui/professionalPortal/login.dart' as professional;

class Home extends StatelessWidget {
  Future _toStudentLogin(BuildContext context) async {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return student.Login();
    });
    Future val = Navigator.of(context).push(route);
    return val;
  }

  Future _toProfessionalLogin(BuildContext context) async {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return professional.Login();
    });
    Future val = Navigator.of(context).push(route);
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            child: Text(" Prep'n"),
          )
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.school),
            title: RaisedButton(
              color: Colors.indigo.shade200,
              onPressed: () => _toStudentLogin(context),
              child: Text(
                "I am a student",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: RaisedButton(
              color: Colors.yellow.shade800,
              onPressed: () => _toProfessionalLogin(context),
              child: Text(
                "I am not a student",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
