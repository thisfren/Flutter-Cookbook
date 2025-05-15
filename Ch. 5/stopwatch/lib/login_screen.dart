// lib/login_screen.dart

import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Colors, Column, EdgeInsets, ElevatedButton, Form, FormState, GlobalKey, Icon, Icons, InputDecoration, MainAxisAlignment, Padding, Scaffold, SizedBox, State, StatefulWidget, Text, TextEditingController, TextFormField, TextInputType, Widget;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  late String name;

  /*
  TextEditingControllers are objects that can be used to manipulate TextFields. 
  In this recipe, we only used them to extract the current value from our TextField, but they can also be used to programmatically set values in the widget, update text selections, and clear the fields.
  There are also some callback functions that be used on TextFields to accomplish the same thing, but, while it may seem easier to use closures instead of TextEditingControllers, it could make your code harder to read.
  */
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  /*
  A simple way to explain GlobalKeys is that they do the opposite of BuildContext.
  BuildContext is an object that can find parents in the widget tree. 
  Keys are objects that are used to retrieve a child widget.
  The topic is a bit more complex than that, but in short, with the key, you can retrieve the Form's state. The FormState class has a public method called validate that will call the validator on all its children.
  */
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm()
      )
    );
  }

  Widget _buildLoginForm() {
    /*
    The Form widget that wraps the two TextFields is a non-rendering container widget. 
    This widget knows how to visit any of its children that are FormFields and invokes their validators.
    If all the validator functions return null, the form is considered valid.
    */
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            TextFields are platform-aware widgets that respect the host platform's UX paradigms.
            As with most things in Flutter, the look of TextFields is highly customizable.
            The default look respects the material design rules, but it can be fully customized using the InputDecoration property.
            */
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                text == "" ? "Enter the runner's name." : null 
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text == "") { // Validator functions should return a string if the validation fails
                  return "Enter the runner's email";
                }

                final regex = RegExp('[^@]+@[^\.]+\..+');
                if (!regex.hasMatch(text!)) {
                  return 'Enter a valid email';
                }

                return null; // If the validation is successful, then the function should return a null
              }
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validate,
              child: Text('Continue')
            )
          ],
        )
      )
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hi $name')
      ]
    );
  }

  void _validate() {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

    setState(() {
      loggedIn = true;
      name = _nameController.text;
    });
  }
}