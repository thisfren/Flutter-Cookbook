import 'package:flutter/cupertino.dart' show CupertinoAlertDialog, CupertinoButton, showCupertinoDialog;
import 'package:flutter/material.dart' show AlertDialog, BuildContext, Navigator, TargetPlatform, Text, TextButton, Theme, showDialog;

class PlatformAlert {
  final String title;
  final String message;

  const PlatformAlert({
    required this.title,
    required this.message
  }); 

  /*
  The ThemeData object has an enum called TargetPlatform that shows the potential options where Flutter can be hosted.
  In this recipe, we are only dealing with mobile platforms (iOS and Android), but currently, there are several more options in this enum, including desktop platforms.
  */
  void show(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }
  }

  void _buildCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close')
            )
          ]
        );
      }
    );
  }

  void _buildMaterialAlert(BuildContext context) {
    /*
    The showDialog method returns a Future<T>, meaning that it can return a value that you can deal with later.
    In the example that follows, we do not need to listen to the user response as we are only giving some information, so the return types of the methods will just be void.
    */
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            )
          ],
        );
      }
    );
  }
}