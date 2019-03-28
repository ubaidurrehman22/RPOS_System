import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> signUp(String user_name,String user_email, String user_password,String shop_name) async {
  FirebaseUser user;
  user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user_email,
      password: user_password,
    );
    adduser(user_name, shop_name, user_email);
    try {
    await user.sendEmailVerification();
    
    return user.uid;
  }
  catch (e) {
    print("An Error Occured during Sending Email");
    print(e.message);
  }
}

Future<void> adduser(String user_name, String shop_name, String user_email) async {
  final databaseReference = FirebaseDatabase.instance.reference();
    try {
      databaseReference.child("1").set({
        'userId': 1,
        'username': user_name,
        'user_email': user_email,
        'shop_name': shop_name
      });
    } catch (e) {
      print("Cannot Add User" + e.message);
    }
  }


Future <void>signin(String email,String password) async{
      FirebaseUser user;
        try {
           user=await FirebaseAuth.instance.signInWithEmailAndPassword(
             email:email,
             password: password
             );
          
        } catch (e) {
          print("User is not registered");
          print(e.message);
      }
      if(user.isEmailVerified){
        print('user verified');
        return user.uid;
      }
      else{
        print('User is not Verified');
        return null;
      }
}
Future <void> forgotpasword (String user_email)async{
  FirebaseUser user;
    await FirebaseAuth.instance.sendPasswordResetEmail(email: user_email);

}