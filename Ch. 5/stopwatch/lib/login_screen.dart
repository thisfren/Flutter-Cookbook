// lib/login_screen.dart

import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Colors, Column, EdgeInsets, ElevatedButton, Form, FormState, GlobalKey, Icon, Icons, InputDecoration, MainAxisAlignment, MaterialPageRoute, Navigator, Padding, Scaffold, SizedBox, State, StatefulWidget, Text, TextEditingController, TextFormField, TextInputType, Widget;
import 'package:stopwatch/stopwatch.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  // bool loggedIn = false;
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
        // child: loggedIn ? _buildSuccess() : _buildLoginForm()
        child: _buildLoginForm()
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

/*
  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hi $name')
      ]
    );
  }
*/
  void _validate() {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }

  /*
    setState(() {
      loggedIn = true;
      name = _nameController.text;
    });
  */

    final name = _nameController.text;
    final email = _emailController.text;

    Navigator.of(context).pushReplacementNamed(
      StopWatch.route,
      arguments: name,
    );

  /*
    /*
    Internally, Navigators function as a stack. Routes can be pushed onto the stack and popped off the stack.
    Normally, you would just use the standard push() and pop() methods to add and remove routes, but as we discussed in this recipe, we didn't just want to push StopWatch onto the screen – we also wanted to pop LoginScreen from the stack at the same time. To accomplish this, we used the pushReplacement method.
    */
    Navigator.of(context).pushReplacement (
      /*
      We also used the MaterialPageRoute class to represent our routes. 
      This object will create a platform-aware transition between the two screens.
      On iOS, it will push onto the screen from right, while on Android, it will pop onto the screen from the bottom.

      Similar to ListView.builder, MaterialPageRoute also expects a WidgetBuilder instead of direct child.
      WidgetBuilder is a function that provides a BuildContext and expects a Widget to be returned:
      builder: (_) => StopWatch(name: name, email: email)
      This allows Flutter to delay the construction of the widget until it's needed.
      We also didn't need the context property, so it was replaced with an underscore.
      */
      MaterialPageRoute(builder: (_) => StopWatch(name: name, email: email))
    );
  */
  }

}