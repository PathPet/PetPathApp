import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:petpath/main.dart';
import 'package:provider/provider.dart';
import 'auth.dart';


class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  get fillColor => null;

  get highlightColor => null;

  get splashColor => null;

  get textColor => null;


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
    //    appBar: AppBar( title: Text("Login Page Flutter Firebase"), ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  SizedBox(
                 height: 135.0,
                      child: Image.asset(
                        "assets/flutter-icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),

                 SizedBox(height: 15.0),    //image ile email arası boşluk
                  TextFormField(
                      onSaved: (value) => _email = value,
                      keyboardType: TextInputType.emailAddress,
                       style: style,
                      decoration: InputDecoration(
                         
                         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                         hintText: "Email",
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                         labelText: "Email Address")),
                 
                 SizedBox(height: 20.0), //password

                  TextFormField(
                      onSaved: (value) => _password = value,
                      obscureText: true,
                       style: style,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        labelText: "Password")),
                 
                 

                  SizedBox(height: 18.0),  //button
                  Material(
                   elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
      
                    onPressed: () async {
                      // save the fields..
                      final form = _formKey.currentState;
                      form.save();

                      // Validate will return true if is valid, or false if invalid.
                      if (form.validate()) {
               //         print("$_email $_password");
                 //       Provider.of(context).loginUser(_email, _password);}
                        try {
                          FirebaseUser result =
                              await Provider.of<AuthService>(context).loginUser(
                                  email: _email, password: _password);
                          print(result);
                        } on AuthException catch (error) {
                          return _buildErrorDialog(context, error.message);
                        } on Exception catch (error) {
                          return _buildErrorDialog(context, error.toString());
                        }
                      //  Navigator.push(context,
                    //     new MaterialPageRoute(builder: (context) => MyHomePage()),
                        //);
                      }
                    },
                        child: Text(
               'Login',
                 textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
                    
                  )
                )
                ]
                )
                )
        )
                );
  }

  

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}










TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);