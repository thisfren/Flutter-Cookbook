// /lib/stopwatch.dart
/*
StatefulWidgets are made up of two classes: the widget and the state.
The widget part of StatefulWidget really doesn't do much, and all the properties that you store in it must be final; otherwise, you will get a compile error.
The State object takes over the build responsibilities from the widget.
States can also be marked as dirty, which is what will cause them to repaint on the next frame.
*/
import 'dart:async' show Timer;
import 'package:flutter/material.dart' show AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, ElevatedButton, Expanded, ListTile, ListView, MainAxisAlignment, Row, Scaffold, SizedBox, State, StatefulWidget, Text, TextButton, Theme, Widget, WidgetStateProperty;
import 'package:flutter/src/widgets/container.dart';


class StopWatch extends StatefulWidget { // A StatefulWidget is divided into two classes –the widget and its state
  @override
  State createState() => StopWatchState();
}

/*
Every StatefulWidget needs a State object that will maintain its life cycle. This is a completely separate class.
StatefulWidgets and their State are so tightly coupled that this is one of the few scenarios where you should keep more than one class in a single file.
*/
class StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  final laps = <int>[];
  late Timer timer;
  bool isTicking = false;

  void onTick(Timer time) {
    setState(() { // The setState function tells Flutter that a widget needs to be repainted
      milliseconds += 100;
    });
  }

/*
  /*
  This method is used to initialize any non-final value in your state class. You can think of it as performing a job similar to a constructor.
  In our example, we used initState to kick off a Timer that fires once a second.
  This method is called before the widget is added to the tree, so you do not have any access to the state's BuildContext property.
  */
  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), onTick);
  }
*/

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
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCounter(context)),
          /*
          One final important thing to keep in mind about scrolling widgets is that because they need to know their parent's constraints to activate scrolling.
          Putting scroll widgets inside widgets with unbounded constraints can cause Flutter to throw errors.
          In our example, we placed ListView inside a Column, which is a flex widget that lays out its children based on their intrinsic size.
          This works fine for widgets such as Containers, Buttons, and Text, but it fails for ListViews.
          To make scrolling work inside Column, we had to wrap it in an Expanded widget, which will then tell ListView how much space it has to work with.
          */
          Expanded(child: _buildLapDisplay())
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)
          ),
          SizedBox(height: 20),
          _buildControls()
        ]
      ),
    );
  }

  Widget _buildControls() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green), // MaterialStatePropery is deprecated
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
              ),
              onPressed: isTicking ? null : _startTimer,
              child: Text('Start')
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: isTicking ? _lap : null,
              child: Text('Lap')
            ),
            SizedBox(width: 20),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
              ),
              onPressed: isTicking ? _stopTimer : null,
              child: Text('Stop'),
            )
          ]
        );
  }

  /*
  Add this helper function just after the build method to make sure that our text is always grammatically correct
  */
  String _secondsText(int milliseconds)  {
    final seconds = milliseconds/ 1000;
    return '$seconds seconds';
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }

  /*
  We're using a type of scrolling widget called ListView, which is probably one of the simplest types of scrolling widgets in Flutter.
  This widget functions a bit like a column, except instead of throwing errors when it runs out of space, ListView will enable scrolling, allowing you to use drag gestures to scroll through all the data.
  */
  Widget _buildLapDisplay() {
    return ListView(
      children: [
        for (int milliseconds in laps)
          ListTile(
            title: Text(_secondsText(milliseconds))
          )
      ]
    );
  }

  void _startTimer() {
    laps.clear();
    timer = Timer.periodic(Duration(milliseconds: 100), onTick);

    setState(() {
      milliseconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();

    setState(() {
      isTicking = false;
    });
  }

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
 Try removing Expanded; the whole widget
will disappear and you should see an error in the Debug console:
*/