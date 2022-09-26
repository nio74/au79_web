import 'package:flutter/material.dart';
import 'dart:math' as math;

class Login_page extends StatefulWidget {
  Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 518,
        height: 471,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              child: Container(
                  width: 520,
                  height: 470,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 1),
                          blurRadius: 20)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              child: Container(
            decoration: const BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Il login e’ necessario',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontFamily: 'Public Sans',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ],
            ),
          )),
          Positioned(
              top: 264,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 281,
                        height: 50,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 30,
                              left: 0,
                              child: Text(
                                '***********',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.5400000214576721),
                                    fontFamily: 'Public Sans',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Text(
                                'Password',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontFamily: 'Public Sans',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )), /*Positioned(
        top: 26,
        left: 257,
        child: null
      ),*/
                        ])),
                    SizedBox(height: 8),
                    Transform.rotate(
                      angle: -0.000005008956130975318 * (math.pi / 180),
                      child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 173,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 281.5,
                        height: 50,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0.5,
                              child: Text(
                                'Username',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontFamily: 'Public Sans',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 29.05078125,
                              left: 0,
                              child: Text(
                                'Pinco',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.5400000214576721),
                                    fontFamily: 'Public Sans',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )), /*Positioned(
        top: 26,
        left: 257.5,
        child: null
      ),*/
                        ])),
                    SizedBox(height: 8),
                    Transform.rotate(
                      angle: -0.000005008956130975318 * (math.pi / 180),
                      child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 40,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Per entrare fai il Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 120, 240, 1),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 357,
              left: 44,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Color.fromRGBO(83, 121, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'entra',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          letterSpacing: 0.46000000834465027,
                          fontWeight: FontWeight.normal,
                          height: 1.7333333333333334),
                    ),
                  ],
                ),
              )),
        ]));
  }
}
