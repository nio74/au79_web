import 'package:au79_web/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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

class WideLayout extends StatefulWidget {
  WideLayout({Key? key}) : super(key: key);

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
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
            const SizedBox(
              height: 20,
            ),
            Text('Login', style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 30,
            ),
            const CustomTextFormField(txtLable: 'Username'),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(txtLable: 'Password'),
            const SizedBox(
              height: 20,
            ),
            const ElevatedButton(onPressed: null, child: Text('Entra'))
          ]),
        ),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Text('Login', style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: 30,
          ),
          const CustomTextFormField(txtLable: 'Username'),
          const SizedBox(
            height: 20,
          ),
          const CustomTextFormField(txtLable: 'Password'),
          const SizedBox(
            height: 20,
          ),
          const ElevatedButton(onPressed: null, child: Text('Entra'))
        ]),
      ),
    );
  }
}
