import 'package:au79_web/page/sign_up.dart';
import 'package:au79_web/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
/*
class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: [
          Menu(),
          // MediaQuery.of(context).size.width >= 980
          //     ? Menu()
          //     : SizedBox(), // Responsive
          Body()
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _menuItem(title: 'Home'),
              _menuItem(title: 'About us'),
              _menuItem(title: 'Contact us'),
              _menuItem(title: 'Help'),
            ],
          ),
          Row(
            children: [
              _menuItem(title: 'Sign In', isActive: true),
              _registerButton()
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 10,
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        'Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In to \nMy Application',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "If you don't have an account",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "You can",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      print(MediaQuery.of(context).size.width);
                    },
                    child: Text(
                      "Register here!",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'images/illustration-2.png',
                width: 300,
              ),
            ],
          ),
        ),

        Image.asset(
          'images/illustration-1.png',
          width: 300,
        ),
        // MediaQuery.of(context).size.width >= 1300 //Responsive
        //     ? Image.asset(
        //         'images/illustration-1.png',
        //         width: 300,
        //       )
        //     : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6),
          child: Container(
            width: 320,
            child: _formLogin(),
          ),
        )
      ],
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter email or Phone number',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            hintText: 'Password',
            counterText: 'Forgot password?',
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: TextStyle(fontSize: 12),
            contentPadding: EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade50),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade50,
                spreadRadius: 10,
                blurRadius: 20,
              ),
            ],
          ),
          child: ElevatedButton(
            child: Container(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Sign In"))),
            onPressed: () => print("it's pressed"),
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _loginWithButton(image: 'images/google.png'),
            _loginWithButton(image: 'images/github.png', isActive: true),
            _loginWithButton(image: 'images/facebook.png'),
          ],
        ),
      ],
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade400),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : BoxDecoration(),
        child: Image.asset(
          '$image',
          width: 35,
        ),
      )),
    );
  }
}

*/

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
                                ..onTap = () => Get.to(() => const SignUp()),
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
                              ..onTap = () => Get.to(() => const SignUp()),
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
