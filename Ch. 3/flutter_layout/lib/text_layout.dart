/*
 * Flutter has a powerful and fast text engine that can render all the rich text that you'd expect from a modern mobile framework.
 * In this recipe, we will be drawing text with Flutter's two primary widgets – Text and RichText.
 * The Text widget is the most common way to quickly print text on the screen, but you will also occasionally need RichText when you want to add even more style within a single line.
 * The Text widget has some basic properties that warrant discussion, such as text alignment and setting a maximum number of lines, but the real meat is in the TextStyle object.
 * There are several properties in TextStyles that are exhaustively covered in the official documentation, but you will most frequently be adjusting the font size, color, weight, and font.
 * As a bonus, Text widgets are accessibility-aware out of the box. There is no extra code that you'll need to write.
 * Text widgets respond to the text to speech synthesizers and will even scale their font size up and down if the user decides to adjust the system's font size.
 */

import 'dart:ui';

import 'package:flutter/material.dart' show BuildContext, Colors, Column, CrossAxisAlignment, Divider, RichText, StatelessWidget, Text, TextSpan, TextStyle, Theme, Widget;

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello, World!',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Text can wrap without an issue',
          /*
          This is used to access design pattern data from other parts higher up the widget tree.
          In this case, we're handing our context to the static Theme.of(context) method, which will then search up the tree to find the closest Theme widget.
          The theme has predetermined colors and text styles that can be added to your widgets so that they will have a consistent look in your app.
          */
          style: Theme.of(context).textTheme.titleLarge
        ),
        Text( // Make sure the Text below is all in one line
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non dui ac ligula facilisis efficitur. Donec ut nunc nec enim fringilla tincidunt.',
        ),

        Divider(),

        RichText( // The RichText widget creates another tree of TextSpan, where each child inherits its parent's style but can override it with its own
          text: TextSpan(
            text: 'Flutter text is ',
            style: TextStyle(fontSize: 22, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'really ',
                style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red
                ),
                children: [
                  TextSpan(
                    text: 'powerful.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      fontSize: 40,
                    )
                  )
                ]
              )
            ]
          )
        )
      ]
    );
  }
}