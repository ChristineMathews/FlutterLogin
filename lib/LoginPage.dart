import 'package:homwdef/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
class LoginPage extends StatefulWidget {
  LoginPage({this.auth});
  final BaseAuth auth;
@override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
    bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      var x = true;
      return x;
    }
    return false;
  }
   void validateAndSubmit() async {
    if (validateAndSave()) {
      try{
      String userId=await widget.auth.signInWithEmailAndPassword(_email, _password);
      //FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
      print('Signed in $userId');
      }
      catch(e){
  
        print('Error $e');
      }
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(1.2, Text("Login", 
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[300]))
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Email or Phone number"
                      ),
                      validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
                      onSaved: (val) => _email = val,
                    ),
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Password"
                      ),
                      validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
                      obscureText: true,
                      onSaved: (val) => _password = val,
                    ),
                  ),
                ],
              ),
            )),
            
            SizedBox(height: 40,),
            FadeAnimation(1.8, Center(
              child: FlatButton(
              child: Container(
                width: 120,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue[800]
                ),
                
                child: Center(child: Text("Login", style: TextStyle(color: Colors.white.withOpacity(.7)),)),
                
              ),
              onPressed:validateAndSubmit,
            )),
            ),
          ],
        ),
      ),
      ),
    );
  }
 }