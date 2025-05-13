// /lib/profile_screen.dart

import 'package:flutter/material.dart' show BoxFit, BuildContext, ClipOval, Column, Container, EdgeInsets, FontWeight, Image, Padding, Row, Scaffold, StatelessWidget, Text, TextStyle, Widget;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildProfileImage(context),
          _buildProfileDetails(context),
          _buildActions(context)
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
    return Container();
  }
}