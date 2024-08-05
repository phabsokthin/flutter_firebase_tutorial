import 'package:firebase2/form/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFormLogin extends StatefulWidget {
  const MyFormLogin({super.key});

  @override
  State<MyFormLogin> createState() => _MyFormLoginState();
}

class _MyFormLoginState extends State<MyFormLogin> {
  @override
  Widget build(BuildContext context) {
    return LoginForm() ;
  }
}


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

                  hintText: 'Phone Number email or password',


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

            }, child: Text("LOGIN", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(
              fixedSize: Size(370, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),

                backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forgot your login details?",),
                SizedBox(width: 2),
                GestureDetector(
                  onTap: (){},
                  child: Text("Get Help", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
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
                       child: Text("Login with google", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
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
                      child: Text("Login with facebook", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),

                SizedBox(height: 35,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color(0xffA2A2A2),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?"),
                    SizedBox(width: 2,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MySignUp()));
                      },
                      child: Text("Create new account", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                    )
                  ],
                )
             ]
        ),
      ),
    );
  }
}

