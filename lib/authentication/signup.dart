// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentmate/animations.dart';
import 'package:rentmate/authentication/login.dart';
import 'package:rentmate/screens/home_screen.dart';

import '../constant.dart';

class SignUPScreen extends StatefulWidget {
  // SignUPScreen({Key? key}) : super(key: key);
  final String? firstName;
  final String? lastName;
  final String? city;
  final String? emailId;
  SignUPScreen({this.firstName, this.lastName, this.emailId, this.city});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final feature = ["Login", "Sign Up"];
  bool enableBtn = false;
  bool isAPIcallProcess = false;
  // String firstName = '';
  String emailId = '';
  // String dateOfBirth = '';
  String firstName = '';
  String lastName = '';
  String city = '';
  // String genderState = '';
  bool otpSent = false;
  // late Timer timer;
  int start = 60;
  // final _formKey = GlobalKey<FormState>();
  // FormData _formData = new FormData();

  List<String> gender = ['Male', 'Female', 'Other'];
  int genderIndex = 1;
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2025));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  int i = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: Color(0xfffdfdfdf),
            body: i == 1
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(25),
                          child: Column(
                            children: [
                              // TabBar Code
                              Row(children: [
                                Container(
                                  height: height / 19,
                                  width: width / 2,
                                  child: TopAnime(
                                    2,
                                    5,
                                    child: ListView.builder(
                                      itemCount: feature.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              i = index;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Text(
                                                  feature[index],
                                                  style: TextStyle(
                                                    color: i == index
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              i == index
                                                  ? Container(
                                                      height: 3,
                                                      width: width / 9,
                                                      color: Colors.black,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),

                                // Profile
                                RightAnime(
                                  1,
                                  15,
                                  curve: Curves.easeInOutQuad,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    // child: Container(
                                    //   width: 60,
                                    //   height: 60,
                                    //   color: Colors.red[400],
                                    //   child: i == 0
                                    //       ? Image(
                                    //           image: NetworkImage(
                                    //               "https://avatars.githubusercontent.com/u/67867070?v=4"),
                                    //         )
                                    //       : Icon(
                                    //           Icons.account_circle_outlined,
                                    //           color: Colors.white,
                                    //           size: 40,
                                    //         ),
                                    // ),
                                  ),
                                ),
                              ]),

                              SizedBox(
                                height: 30,
                              ),

                              // Top Text
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: width,
                                child: TopAnime(
                                  1,
                                  20,
                                  curve: Curves.fastOutSlowIn,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          // text: "Hello",
                                          // style: TextStyle(
                                          //   color: Colors.black,
                                          //   fontSize: 40,
                                          //   fontWeight: FontWeight.w300,
                                          // ),
                                          children: [
                                            TextSpan(
                                              text: "Welcome,",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Enter your informations below or \nlogin with a social account",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height / 18,
                              ),

                              // TextFiled
                              Container(
                                width: width / 1.2,
                                height: height / 2.55,
                                child: TopAnime(
                                  1,
                                  16,
                                  curve: Curves.easeInExpo,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        // readOnly: true, // * Just for Debug
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        showCursor: true,
                                        //cursorColor: mainColor,
                                        decoration: kTextFiledInputDecoration,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      TextField(
                                          // readOnly: true, // * Just for Debug
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          showCursor: true,
                                          //cursorColor: mainColor,
                                          decoration: kTextFiledInputDecoration
                                              .copyWith(labelText: "Password")),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      TextField(
                                        // readOnly: true, // * Just for Debug
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        showCursor: true,
                                        //cursorColor: mainColor,
                                        decoration:
                                            kTextFiledInputDecoration.copyWith(
                                                labelText: "Password again"),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),

                                      // FaceBook and Google ICon
                                      TopAnime(
                                        1,
                                        11,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: FaIcon(
                                                FontAwesomeIcons.facebookF,
                                                size: 30,
                                              ),
                                              onPressed: () {},
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                              icon: FaIcon(
                                                  FontAwesomeIcons.googlePlusG,
                                                  size: 35),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom
                        i == 1
                            ? TopAnime(
                                2,
                                29,
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  height: height / 6,
                                  // color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 43),
                                        child: Container(
                                            height: height / 9,
                                            color:
                                                Colors.grey.withOpacity(0.4)),
                                      ),
                                      Positioned(
                                        left: 280,
                                        top: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffEB5757),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: width / 4,
                                            height: height / 12,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : LoginScreen()
                      ],
                    ),
                  )
                : LoginScreen()),
      ),
    );
  }
}
