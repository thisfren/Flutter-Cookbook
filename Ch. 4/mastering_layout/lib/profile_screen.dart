// /lib/profile_screen.dart

import 'package:flutter/material.dart' show BuildContext, Column, Container, Scaffold, StatelessWidget, Widget;

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
    return Container();
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Container();
  }

  Widget _buildActions(BuildContext context) {
    return Container();
  }
}