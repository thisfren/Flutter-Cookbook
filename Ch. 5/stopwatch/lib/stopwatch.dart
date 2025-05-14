// /lib/stopwatch.dart
/*
StatefulWidgets are made up of two classes: the widget and the state.
The widget part of StatefulWidget really doesn't do much, and all the properties that you store in it must be final; otherwise, you will get a compile error.
The State object takes over the build responsibilities from the widget.
States can also be marked as dirty, which is what will cause them to repaint on the next frame.
*/
import 'dart:async' show Timer;
import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Scaffold, State, StatefulWidget, Text, Theme, Widget;


class StopWatch extends StatefulWidget { // A StatefulWidget is divided into two classes –the widget and its state
  @override
  State createState() => StopWatchState();
}

/*
Every StatefulWidget needs a State object that will maintain its life cycle. This is a completely separate class.
StatefulWidgets and their State are so tightly coupled that this is one of the few scenarios where you should keep more than one class in a single file.
*/
class StopWatchState extends State<StopWatch> {
  int seconds = 0;
  late Timer timer;

  /*
  This method is used to initialize any non-final value in your state class. You can think of it as performing a job similar to a constructor.
  In our example, we used initState to kick off a Timer that fires once a second.
  This method is called before the widget is added to the tree, so you do not have any access to the state's BuildContext property.
  */
  @override
  void initState() {
    super.initState();

    void _onTick(Timer time) {
      setState(() { // The setState function tells Flutter that a widget needs to be repainted
        ++seconds;
      });
    }

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  /*
  The State's build method is identical to StatelessWidget's build method and is required.
  Here, you are expected to define and return this widget's tree. In other words, you should create the UI.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stopwatch'
        )
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headlineMedium
        )
      )
    );
  }

  /*
  Add this helper function just after the build method to make sure that our text is always grammatically correct
  */
  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  /*
  Finally, we just need to make sure the timer stops ticking when we close the screen. 
  This cleanup method is called when the state object is removed from the widget tree.
  This is your last opportunity to clean up any resources that need to be explicitly released.
  */
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

/*
The State class has a life cycle.
Unlike StatelessWidget, which is nothing more than a build method, StatefulWidgets have a few different life cycle methods that are called in a specific order.
In this recipe, you used initState and dispose, but the full list of life cycle methods, in order, is as follows:
initState
didChangeDependencies
didUpdateWidget
build (required)
reassemble
deactivate
dispose
*/