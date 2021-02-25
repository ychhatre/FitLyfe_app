import 'dart:io';
import 'package:FitLyfe_app/components/bubblepainter.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

//test
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          Image(image: AssetImage("assets/workout2.jpg")),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Text("Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF003668)))),
              Container(
                  height: 40,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                          style: TextStyle(fontFamily: "Poppins"),
                          decoration: InputDecoration(
                            icon: Icon(AntDesign.idcard),
                            hintText: "DISPLAY NAME",
                            hintStyle: TextStyle(
                                fontFamily: "PoppinsThin", fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                          )))),
              Container(
                  height: 40,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                          style: TextStyle(fontFamily: "Poppins"),
                          decoration: InputDecoration(
                            icon: Icon(AntDesign.user),
                            hintText: "USERNAME",
                            hintStyle: TextStyle(
                                fontFamily: "PoppinsThin", fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                          )))),
              Container(
                  height: 40,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                          style: TextStyle(fontFamily: "Poppins"),
                          decoration: InputDecoration(
                            icon: Icon(AntDesign.mail),
                            hintText: "EMAIL",
                            hintStyle: TextStyle(
                                fontFamily: "PoppinsThin", fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                          )))),
              Container(
                  height: 40,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                          style: TextStyle(fontFamily: "Poppins"),
                          decoration: InputDecoration(
                            icon: Icon(AntDesign.lock),
                            hintText: "PASSWORD",
                            hintStyle: TextStyle(
                                fontFamily: "PoppinsThin", fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]),
                            ),
                          )))),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: FlatButton(
                      color: Color(0xFF003668), child: Text("Sign Up")))
            ]),
          )
        ]));
  }
}
