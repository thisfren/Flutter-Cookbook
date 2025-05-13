// lib/flex_screen.dart
/*
 * Today, almost every device has a different height and width.
 * Some devices also have a notch at the top of the screen that insets into the available screen space.
 * In short, you cannot assume that your app will look the same on every screen—you have to be flexible.
 * Column and Row widgets do not just position widgets one after another—
 * they also implement a variable on the FlexBox algorithm, allowing you to write UIs that should always look correct, regardless of the screen size.
 * 
 * In this recipe, we will demonstrate two ways to develop proportional widgets: 
 * Flexible and Expanded widgets.
 */



import 'package:flutter/material.dart' show AppBar, BorderRadius, BoxDecoration, BuildContext, Center, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, Expanded, Flexible, Padding, Row, SafeArea, Scaffold, SizedBox, StatelessWidget, Text, Theme, Widget;
import 'package:mastering_layout/labeled_container.dart';


class FlexScreen extends StatelessWidget {
  const FlexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    On some devices, the header or footer covers up some software or hardware features (such as the notch or the Home button).
    To fix this, just wrap the Scaffold in a SafeArea widget
    */
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible and Expanded'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ..._header(context, 'Expanded'),
            _buildExpanded(context),
            ..._header(context, 'Flexible'),
            _buildFlexible(context),
            Expanded(child: Container(),),
            _buildFooter(context)
          ]
        )
      )
    );
  }

  Iterable<Widget> _header(BuildContext context, String text) {
    return [
      SizedBox(height: 20),
      Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium
      )
    ];
  }
 
  /*
  The Expanded widget will take up all the remaining unconstrained space from a Row or a Column.
  In the preceding example, we placed three containers in the first row.
  The container was given a width of 100 units. The last container was given a width of 40 units.
  The middle container is wrapped in an Expanded widget, so it consumes all the remaining space in the row.
  These explicit values are referred to as constrained spacing.
  It is very common to create an Expanded widget with an empty container that will simply consume the remaining space in a Row or Column.
  */
  Widget _buildExpanded(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          LabeledContainer(
            width: 100,
            color: Colors.green,
            text: '100',
          ),
          Expanded(
            child: LabeledContainer(
              color: Colors.purple,
              text: 'The Remainder',
              textColor: Colors.white
            )
          ),
          LabeledContainer(
            width: 40,
            color: Colors.green,
            text: '40'
          )
        ]
      )
    );
  }

  /*
  The Flexible widget behaves similarly to the Expanded widget, but it also has the ability to set a flex value, which can be used to help calculate howmuch space it should use.
  When Flutter lays out Flexible widgets, it takes the sum of the flex values to calculate the percentage of the proportional space that needs to be applied to each widget.
  An Expanded widget is actually just a Flexible widget with a flex value of 1. 
  We could, in theory, replace all references to Expanded to Flexible and the app would be unchanged.
  */
  Widget _buildFlexible(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.orange,
              text: '25%'
            )
          ),
          Flexible(
            flex: 1,
            child: LabeledContainer(
              color: Colors.deepOrange,
              text: '25%'
            )
          ),
          Flexible(
            flex: 2,
            child: LabeledContainer(
              color: Colors.blue,
              text: '50%'
            )
          )
        ]
      )
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(40)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Text(
            'Pinned to the Bottom',
            style: Theme.of(context).textTheme.headlineSmall
          )
        )
      )
    );
  }
}