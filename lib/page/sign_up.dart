import 'package:au79_web/page/log_in.dart';
import 'package:au79_web/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        return WideLayout();
      } else {
        return NarrowLayout();
      }
    }));
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/93252.jpg'), fit: BoxFit.cover)),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Text(
              'Au79Repairs',
              style: TextStyle(
                  color: Colors.cyan, fontFamily: 'PT Serif', fontSize: 80),
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                //constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(0, 0, 0, 25),
                        offset: Offset(0, 1),
                        blurRadius: 20)
                  ],
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    SizedBox(
                      height: h * 0.08,
                    ),
                    Text('Ciao', style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    const Text('Registra il tuo account',
                        style: TextStyle(
                            fontFamily: 'PT Serif',
                            fontSize: 15,
                            color: Colors.black87)),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    const CustomTextFormField(txtLable: 'Username'),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    const CustomTextFormField(txtLable: 'Password'),
                    SizedBox(
                      height: h * 0.09,
                    ),
                    Container(
                      width: w * 0.5,
                      height: h * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor),
                      child: const Center(
                        child: Text(
                          'Entra',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: 'PT Serif',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.09,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Hai gi/à un account?',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontFamily: 'PT Serif',
                                fontSize: 20),
                            children: [
                          TextSpan(
                              text: ' Entra',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => LoginPage()),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'PT Serif',
                                  fontSize: 20)),
                        ]))
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NarrowLayout extends StatefulWidget {
  NarrowLayout({Key? key}) : super(key: key);

  @override
  State<NarrowLayout> createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(0, 0, 0, 25),
                offset: Offset(0, 1),
                blurRadius: 20)
          ],
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              //constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(0, 0, 0, 25),
                      offset: Offset(0, 1),
                      blurRadius: 20)
                ],
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Text('Ciao', style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  const Text('Entra con il tuo account',
                      style: TextStyle(
                          fontFamily: 'PT Serif',
                          fontSize: 15,
                          color: Colors.black87)),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  const CustomTextFormField(txtLable: 'Username'),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  const CustomTextFormField(txtLable: 'Password'),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text('Hai dimenticato la password?',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.09,
                  ),
                  Container(
                    width: w * 0.5,
                    height: h * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor),
                    child: const Center(
                      child: Text(
                        'Entra',
                        style: TextStyle(
                            fontSize: 36,
                            fontFamily: 'PT Serif',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.09,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Non hai un account?',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'PT Serif',
                              fontSize: 20),
                          children: [
                        TextSpan(
                            text: ' Registrati',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('link premuto'),
                            style: const TextStyle(
                                color: Colors.black54,
                                fontFamily: 'PT Serif',
                                fontSize: 20)),
                      ]))
                ]),
              ),
            )));
  }
}
