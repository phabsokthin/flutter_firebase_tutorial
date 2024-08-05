import 'package:firebase2/form/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  @override
  Widget build(BuildContext context) {
    return SignupForm();
  }
}



class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignupForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: [
              Container(

                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 100),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 40,color: Colors.white,),
                ) ,
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xffE8E8E8),
                    filled: true,

                    hintText: 'Full Name',


                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xffE8E8E8),
                    filled: true,

                    hintText: 'Email Address',


                  ),
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none
                    ),
                    fillColor: Color(0xffE8E8E8),
                    filled: true,

                    hintText: 'Password',


                  ),
                ),
              ),


              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){

              }, child: Text("CREATE ACCOUNT", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(
                  fixedSize: Size(370, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),

                  backgroundColor: Colors.blue),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 2),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginForm()));
                    },
                    child: Text("Already have account?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),

              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 160,
                      height: 1,
                      color: Color(0xffA2A2A2),
                    ),
                    Container(
                      child: Text("OR", style: TextStyle(color: Colors.black),),
                    ),

                    Container(
                      width: 160,
                      height: 1,
                      color: Color(0xffA2A2A2),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.only(left: 52, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.google, size: 20, color: Colors.orange,),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: (){},
                      child: Text("Connect with google", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),

              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.only(left: 70, right: 50),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.facebook, size: 20, color: Colors.blue,),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: (){},
                      child: Text("Connect with facebook", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),

            ]
        ),
      ),
    );
  }
}


