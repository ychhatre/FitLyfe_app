import 'dart:io';
import 'package:FitLyfe_app/components/bubblepainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class  LogInSignUpPage extends StatefulWidget {
  @override
  _LogInSignUpPageState createState() => _LogInSignUpPageState();
}

class _LogInSignUpPageState extends State<LogInSignUpPage> with SingleTickerProviderStateMixin{
  String email, password, message, currentUser, displayName, username;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeUsername = FocusNode();
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();


  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupUsernameController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
  new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "Poppins"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "Poppins"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height >= 775.0
                    ? MediaQuery.of(context).size.height
                    : 775.0,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [

                        Color(0xFFFFE1B0),
                        Color(
                            0xFFFFC564
                        ),



                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.5),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 65),
                      child: Container(
                          child: Image(
                            height: 100,
                            image: AssetImage(
                              "assets/FitLyfeLogo.png"
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: _buildMenuBar(context),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (i) {
                          if (i == 0) {
                            setState(() {
                              right = Colors.white;
                              left = Colors.black;
                            });
                          } else if (i == 1) {
                            setState(() {
                              right = Colors.black;
                              left = Colors.white;
                            });
                          }
                        },
                        children: <Widget>[
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildSignIn(context),
                          ),
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: _buildSignUp(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  @override
  void dispose() {
    myFocusNodeUsername.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // checkUsername();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }
  Widget _buildSignIn(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(

      //padding: EdgeInsets.only(top: 23.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.22),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 6), // changes position of shadow
                        ),
                      ]
                  ),

                  width: 300.0,
                  height: 300.0,
                  child: Column(children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          width: 350.0,
                          height: 190.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 20.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: myFocusNodeEmailLogin,
                                  controller: loginEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontFamily: "DMSans",
                                    fontSize: 16.0,
                                    color: const Color(
                                      0XFF38393F,
                                    ),
                                  ),
                                  decoration: InputDecoration(

                                    prefixIcon: Icon(
                                      FontAwesomeIcons.envelope,
                                      color: const Color(
                                        0XFF777F87,
                                      ),
                                      size: 20.0,
                                    ),

                                    hintText: "Email Address",
                                    hintStyle: TextStyle(
                                        fontFamily: "DMSans", fontSize: 17.0),
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return "Please fill in all the fields";
                                    }
                                  },
                                  onSaved: (input) => email = input,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 15.0, left: 25.0, right: 25.0),
                                child: TextFormField(
                                  focusNode: myFocusNodePasswordLogin,
                                  controller: loginPasswordController,
                                  obscureText: _obscureTextLogin,
                                  style: TextStyle(
                                      fontFamily: "DMSans",
                                      fontSize: 16.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(

                                    prefixIcon: Icon(
                                      FontAwesomeIcons.lock,
                                      size: 20.0,
                                      color: const Color(
                                        0XFF777F87,
                                      ),
                                    ),
                                    hintText: "Password",

                                    hintStyle: TextStyle(
                                        fontFamily: "DMSans", fontSize: 17.0),
                                    suffixIcon: GestureDetector(
                                      onTap: _toggleLogin,
                                      child: Icon(
                                        _obscureTextLogin
                                            ? FontAwesomeIcons.solidEyeSlash
                                            : FontAwesomeIcons.solidEye,
                                        size: 15.0,
                                        color: const Color(
                                          0XFF777F87,
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (input) {
                                    if (input.isEmpty) {
                                      return "Please fill in all the fields";
                                    }
                                  },
                                  onSaved: (input) => password = input,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 177),
                          child: MaterialButton(
                            color: const Color(
                                0xFFFFC564
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 28.0),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0,
                                    fontFamily: "DMSans"),
                              ),
                            ),
                            onPressed: signIn,
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: GestureDetector(
                              onTap: _onSignUpButtonPress,
                              child: Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(
                                    color: const Color(
                                      0XFF38393F,
                                    ),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
            ],
          ),
        ));
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
        child: Form(
          key: _globalKey,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white70,
                boxShadow: [
                        BoxShadow(
                           color: Colors.grey.withOpacity(0.22),
                           spreadRadius: 5,
                           blurRadius: 7,
                           offset: Offset(0, 6), // changes position of shadow
                        ),
                            ]
                    ),

                    width: 300.0,
                    height: 450.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: myFocusNodeName,
                            controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: const Color(
                                0XFF777F87,
                              ),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                color: const Color(
                                  0XFF777F87,
                                ),
                                size: 20.0,
                              ),

                              hintText: "Name",

                              hintStyle:
                              TextStyle(fontFamily: "DMSans", fontSize: 16.0),
                            ),
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Please fill in all the fields";
                              }
                            },
                            onSaved: (input) => displayName = input,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 3, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: myFocusNodeUsername,
                            controller: signupUsernameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: const Color(
                                0XFF777F87,
                              ),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesomeIcons.at,
                                color: const Color(
                                  0XFF777F87,
                                ),
                                size: 20.0,
                              ),

                              hintText: "Username",

                              hintStyle:
                              TextStyle(fontFamily: "DMSans", fontSize: 16.0),
                            ),

                            validator: (input) {
                              if (input.isEmpty) {
                                return "Please fill in all the fields";
                              }
                            },
                            // onChanged: (value) {
                            //   setState(() {
                            //     print("The username is " + value.trim().toLowerCase());
                            //   });
                            //   // print("The username is " + username);
                            // },
                            onSaved: (input) => username = input,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: myFocusNodeEmail,
                            controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontFamily: "DMSans",
                              fontSize: 16.0,
                              color: const Color(
                                0XFF777F87,
                              ),
                            ),
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                FontAwesomeIcons.envelope,
                                color: const Color(
                                  0XFF777F87,
                                ),
                                size: 20.0,
                              ),
                              hintText: "Email Address",

                              hintStyle: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),

                            validator: (input) {
                              if (input.isEmpty) {
                                return "Please fill in all the fields";
                              }
                            },
                            onSaved: (input) => email = input,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 0.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                              controller: signupConfirmPasswordController,
                              obscureText: _obscureTextSignupConfirm,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 16.0,
                                color: const Color(
                                  0XFF777F87,
                                ),
                              ),
                              decoration: InputDecoration(

                                prefixIcon: Icon(
                                  FontAwesomeIcons.lock,
                                  color: const Color(
                                    0XFF777F87,
                                  ),
                                  size: 20.0,
                                ),
                                hintText: "Password",

                                hintStyle:
                                TextStyle(fontFamily: "DMSans", fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleSignupConfirm,
                                  child: Icon(
                                    _obscureTextSignupConfirm
                                        ? FontAwesomeIcons.solidEyeSlash
                                        : FontAwesomeIcons.solidEye,
                                    size: 15.0,
                                    color: const Color(
                                      0XFF777F87,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Please fill in all the fields";
                                }
                              },
                              onSaved: (input) => password = input),
                        ),
                        Padding(
                            padding:EdgeInsets.only(top:50,bottom:20 ),
                            child:Container(

                              child: MaterialButton(
                                  color: const Color(
                                      0xFFFFC564
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 28.0),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                          fontFamily: "DMSans"),
                                    ),
                                  ),
                                  onPressed: signUp),
                            )),

                        Container(


                          child: GestureDetector(
                            onTap: _onSignInButtonPress,
                            child: Text(
                              "Already have an account? Sign in",
                              style: TextStyle(
                                  color: const Color(
                                    0XFF38393F,
                                  ),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ],
          ),
        ));
  }



  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
  signUp(){

  }
  signIn(){

  }
}


