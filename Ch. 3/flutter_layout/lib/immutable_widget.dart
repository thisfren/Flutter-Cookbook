/*
 * There is some boilerplate with stateless widgets, but you can create themwith a simple code snippet.
 * Just type stless. Hit Enter on your keyboard and the template will appear.
 */

import 'package:flutter/material.dart' show Alignment, BlendMode, BorderRadius, BoxDecoration, BoxShadow, BoxShape, BuildContext, Color, Colors, Container, EdgeInsets, LinearGradient, Offset, Padding, RadialGradient, Radius, StatelessWidget, Transform, Widget;
import 'dart:math' as Math show pi;


class ImmutableWidget extends StatelessWidget {
  ImmutableWidget({super.key});

  /*
  This method returns a Container widget (green), 
  which contains a Padding widget, 
  which in turn contains another Container widget (purple), 
  which contains another Padding widget, 
  and which contains the last Container widget (blue) of this tree.
  */
  @override
  Widget build(BuildContext context) {
    /*
    A container is similar to a div in HTML. 
    It's rendered as a box that has many styling options.
    The three Container widgets are separated by two paddings of slightly different sizes.
    */
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      foregroundDecoration: BoxDecoration(
        backgroundBlendMode: BlendMode.colorBurn,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xAA0d6123),
            Color(0x00000000),
            Color(0xAA0d6123),
          ]
        )
      ),
      /*
      In this example, we have chosen to create Padding (with an uppercase P) as a widget.
      Container widgets also have a padding (lowercase p) property that can specify some padding for the container itself.
      The Padding widget will adjust the spacing of its child, which can be any widget of any shape or size.
      */
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Transform.rotate(
          angle: 180 / Math.pi, // Rotations are supplied in radians
          child: Container( // Container widgets can add all manner of effects to their child
            width: 250,
            height: 250,
            decoration: BoxDecoration( // BoxDecoration can draw borders, shadows, colors, gradients, images and shapes
              color: Colors.purple,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withAlpha(120),
                  spreadRadius: 4,
                  blurRadius: 15,
                  offset: Offset.fromDirection(1, 30),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: _buildShinyCircle(),
            )
          ),
        )
      )
    );
  }


  Widget _buildShinyCircle() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient (
          colors: [
            Colors.lightBlueAccent,
            Colors.blueAccent,
          ],
          center: Alignment(-0.3, -0.5),
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20)
        ]
      )
    );
  }
}