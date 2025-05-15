// /lib/stopwatch.dart
/*
StatefulWidgets are made up of two classes: the widget and the state.
The widget part of StatefulWidget really doesn't do much, and all the properties that you store in it must be final; otherwise, you will get a compile error.
The State object takes over the build responsibilities from the widget.
States can also be marked as dirty, which is what will cause them to repaint on the next frame.
*/
import 'dart:async' show Timer;
import 'package:flutter/material.dart' show AppBar, BuildContext, ButtonStyle, Color, Colors, Column, Container, Curves, EdgeInsets, ElevatedButton, Expanded, ListTile, ListView, MainAxisAlignment, ModalRoute, Row, Scaffold, ScrollController, Scrollbar, SizedBox, State, StatefulWidget, Text, TextButton, Theme, Widget, WidgetStateProperty;


class StopWatch extends StatefulWidget { // A StatefulWidget is divided into two classes –the widget and its state
  static const route = '/stopwatch';
  /*
  The constructor for the StopWatch widget needs to be updated so that it can accept the name and email.
  */
  final String name;
  final String email;

  const StopWatch({
    super.key,
    this.name = "",
    this.email = ""
  });

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

  final itemHeight = 60.0;
  final scrollController = ScrollController();

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
    /*
    Passing data between named routes also requires a bit more thought.
    You cannot use any custom constructor because WidgetBuilder is already defined and locked in MaterialApp.
    Instead, you can use arguments to add anything you want to pass to the next screen.
    If you take a look at the definition of the pushNamed function, you'll see that the type for arguments is simply Object.
    This code is not safe in itself.
    There is no guarantee that the value that was passed into the arguments is a string or even exists at all.
    Passing arguments through named routes requires some effort, especially if you want to do so safely.
    For these reasons, it's recommended that you use manually constructed routes when you need to pass data back and forth between your screens.
    */
    String name = ModalRoute.of(context)?.settings.arguments.toString() ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name
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

    /*
    ScrollController is a special object that allows to key into ListView from outside the build methods.
    This is a frequently used pattern in Flutter where you can optionally provide a controller object that has methods to manipulate its widget.
    */
    scrollController.animateTo(
      itemHeight * laps.length, // The first property of this function wants to know where in ListView to scroll
      duration: Duration(milliseconds : 500), // The second property dictates the length of the animation
      curve: Curves.easeIn // The final property tells the animation to slow down as it reaches its destination
    );
  }

  Widget _buildLapDisplay() {
    /*
    We're using a type of scrolling widget called ListView, which is probably one of the simplest types of scrolling widgets in Flutter.
    This widget functions a bit like a column, except instead of throwing errors when it runs out of space, ListView will enable scrolling, allowing you to use drag gestures to scroll through all the data.
    return ListView(
      children: [
        for (int milliseconds in laps)
          ListTile(
            title: Text(_secondsText(milliseconds)),
          )
      ],
    );
    */
    return Scrollbar(  
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight, // The itemExtent property is a way to supply a fixed height to all the items in ListView
        /*
        To build an optimized ListView with its builder constructor, you need to tell Flutter how large the list is via the itemCount property.
        If you don't include it, Flutter will think that the list is infinitely long and it will never terminate.
        There may be a few cases where you want to use an infinite list, but they are rare.In most cases, you need to tell Flutter how long the list is; otherwise, you will get an "out of bounds" error.
        */
        itemCount: laps.length,
        /*
        itemBuilder enables deferred rendering.
        We are no longer providing Flutter with a list of widgets. Instead, we are waiting for Flutter to use what it needs and only creating widgets for a subset of our list.
        As the user scrolls, Flutter will continuously call the itemBuilder function with the appropriate index.
        When widgets move off the screen, Flutter can remove them from the tree, freeing up precious memory.
        */
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds))
          );
        }
      ),
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