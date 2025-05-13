// /lib/profile_screen.dart

import 'package:flutter/material.dart' show BoxFit, BuildContext, ClipOval, Column, Container, Image, Scaffold, StatelessWidget, Widget;

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
          'assets/khachik_simonian_beach_unsplash.jpg',
          fit: BoxFit.fitWidth
        )
      )
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Container();
  }

  Widget _buildActions(BuildContext context) {
    return Container();
  }
}