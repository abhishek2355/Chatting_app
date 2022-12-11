// ignore_for_file: prefer_const_constructors

import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/text_filled_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  void loginuser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  chat_page(username: userNameController.text)));
      print("Login Sussesfull...!!");
    } else {
      print("Login Failed!");
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Let's Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlue.shade900,
                  fontFamily: 'Fasthand-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('build/flutter_assets/image/test.jpg')),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      // obscureText: true,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return 'Username should be more than 5 character.';
                        } else if (value != null && value.isEmpty) {
                          return 'Please enter your username.';
                        }
                        return null;
                      },
                      controller: userNameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          hintText: "Enter Your Username!",
                          hintStyle: ThemeTextStyle.loginTextFieldStyle,
                          focusColor: Colors.amber,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return 'Password should be more than 5 character.';
                        } else if (value != null && value.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password!",
                          hintStyle: ThemeTextStyle.loginTextFieldStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          suffixIcon: IconButton(
                            icon:
                                Icon(Icons.remove_red_eye, color: Colors.blue),
                            onPressed: () {},
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginuser(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      primary: Colors.blue.shade400),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'FjallaOne-Regular',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              InkWell(
                splashColor: Colors.orange,
                onTap: () async {
                  //ToDO...
                  print("text linkable");
                  // ignore: deprecated_member_use
                  if (!await launch(
                      'https://www.linkedin.com/in/rautabhishek/')) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Find us on',
                      style: TextStyle(fontFamily: 'FjallaOne-Regular'),
                    ),
                    Text(
                      'Linked in',
                      style: TextStyle(fontFamily: 'FjallaOne-Regular'),
                    )
                  ],
                ),
              ),

              // ignore: prefer_const_literals_to_create_immutables
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.instagram(
                      color: Colors.red,
                      url: "https://www.instagram.com/abhishekraut2222/"),
                  SocialMediaButton.facebook(
                      color: Colors.blue.shade900,
                      url:
                          "https://www.facebook.com/profile.php?id=100027682627597"),
                  SocialMediaButton.github(
                      url: "https://github.com/abhishek2355")
                ],
              )
            ],
          ),
        )));
  }
}
