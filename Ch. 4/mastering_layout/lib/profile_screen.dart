// /lib/profile_screen.dart

/*
 * This is a simple profile screen that displays a profile image, name, age, and status.
 * The Flutter tools also have a setting called Debug Paint, which you can activate from the Flutter tools in your editor or from the command line.
 * This feature will draw lines around your widgets so that you can see in more detail how they are being rendered, which can be useful to catch layout errors.
 */
import 'package:flutter/material.dart' show BoxFit, BuildContext, ClipOval, Column, Container, EdgeInsets, FontWeight, Icon, IconData, Icons, Image, MainAxisAlignment, Padding, Row, Scaffold, Stack, StatelessWidget, Text, TextStyle, Transform, Widget;
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 
      body: Column(
        children: <Widget>[
          _buildProfileImage(context),
          _buildProfileDetails(context),
          _buildActions(context)
        ]
      )
      */
      // In order to place widgets on top of each other, you can use a Stack widget
      body: Stack(
        children: <Widget>[
          Image.asset('assets/khachik_simonian_beach_unsplash.jpg'),
          Transform.translate(
            offset: Offset(0, 100),
            child: Column(
              children: <Widget>[
                _buildProfileImage(context),
                _buildProfileDetails(context),
                _buildActions(context)
              ]
            )
          )
        ]
      )
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: ClipOval(
        child: Image.asset(
          'assets/jose-alejandro-cuffia-dog-unsplash.jpg',
          fit: BoxFit.fitWidth
        )
      )
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            'Wolfram Barkovich',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600)
          ),
          _buildDetailsRow('Age', '4'),
          _buildDetailsRow('Status', 'Good Boy')
        ]
      )
    );
  }

  /*
  The only real difference between a Row widget and a Column widget is the axis in which they lay out their children.
  It's interesting that you can insert a Row widget into a Column widget and vice versa.
  There are also two properties on Column and Row widgets that can modify how Flutter lays out your widgets:
    CrossAxisAlignment
    MainAxisAlignment
  These are abstractions on the x and y axis. 
  They are also referring to different axes depending on whether you are using a Row widget or a Column widget
  */
  Widget _buildDetailsRow(String heading, String value) {
    return Row(
      children: <Widget>[
        Text(
          '$heading: ',
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
        Text(value)
      ]
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ]
    );
  }

  Widget _buildIcon(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40),
          Text(text)
        ]
      )
    );
  }
}