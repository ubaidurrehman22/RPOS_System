import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'stacked_icons.dart';
import 'home.dart';
import 'Signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'slider.dart';
import '../Database/firebase_auth.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email_control=new TextEditingController();
  TextEditingController password_control=new TextEditingController();

  bool email_validate=false;
  bool password_validate=false;

  String _email,_password;
  @override
   Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.deepPurple, //or set color with: Color(0xFF0000FF)
    ));
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
          body: SingleChildScrollView(
          child: Form(
            
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new StakedIcons(),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                      child: new Text(
                        "RPOS System",
                        style: new TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.redAccent),
                      ),
                    )
                  ],
                ),
                new SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.black,
                      errorText: email_validate ? 'Enter Email.':null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontFamily: "Roboto", color: Colors.black),
                    onChanged: (v)=>_email=v,
                    controller: email_control,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      fillColor: Colors.black,
                      errorText: password_validate ? 'Enter password': null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      //fillColor: Colors.green
                    ),
                    style: TextStyle(fontFamily: "Roboto", color: Colors.black),
                    onChanged: (v)=>_password=v,
                    controller: password_control,
                  ),
                ),
                
                new SizedBox(
                  height: 10.0,
                ),
               
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:20),
                        child: RaisedButton(

                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          onPressed:(){
                                      email_control.text.isEmpty
                                      ? email_validate=true
                                      : email_validate=false;
                                      password_control.text.isEmpty
                                      ? password_validate=true
                                      :password_validate=false;
                                      if(email_validate==false && password_validate==false){
                                       signin(_email,_password);
                                      }
                          } ,
                          // onPressed: signin,
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),      
                              child: new Text("Sign In",
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                        ),
                    ),
                  ],
              
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                    onTap:(){
                     forgotpasword(_email);
                    },
                
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0),
                    
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: new Text("Forgot Password?",
                            style: new TextStyle(
                                fontSize: 17.0, color: Colors.redAccent))),
                  ),
                   ),
                  ]
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>SignupPage()));
                      },
                    child:Padding(
                        padding: EdgeInsets.only(left: 20,top: 20,right: 20),
                        child: Container(
                          child: new Text(
                            'Create new Account',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                            ),
                          ),
                        ),
                    )
                    )
                ],
                ),
              ]
            ),
          )
          ),
    );
  }
}


// class LoginPage extends StatelessWidget {
//   final _formkey=GlobalKey<FormState>();
//   String _email='ubaidurrehman225786@gmail.com',_password='123456';
  
//   @override
//   Widget build(BuildContext context) {
    
// SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//   statusBarColor: Colors.blueAccent, //or set color with: Color(0xFF0000FF)
// ));
   
//   }

  // SignIn
  
