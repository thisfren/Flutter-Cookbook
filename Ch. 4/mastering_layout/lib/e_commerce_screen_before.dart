// lib/e_commerce_screen_before.dart

/*
If you have widget trees or statements that are repeated throughout your code, you should refactor your code.
If you can accomplish the same result with less code, then you will have fewer bugs and be able to change your code faster.
When you invoke the extract method, your IDE will set the return to whatever top-level widget you are extracting.
If you are extracting a Row widget, the return type of your method will be a row.
It's usually considered best practice to change the return type to the widget superclass instead of something more specific.
The benefit is that if you ever update the root widget in your build method to some other widget, you don't have to change the method signature.
A Row is a widget. A Column is a widget. A Padding is a widget.
Ensuring that your return type is always Widget will remove any blocks as your app grows.
*/
import 'package:flutter/material.dart' show AppBar, BorderRadius, BoxDecoration, BoxFit, BuildContext, Center, Color, Colors, Column, Container, CrossAxisAlignment, EdgeInsets, Expanded, FontWeight, Icon, Icons, Image, MainAxisAlignment, Padding, Radius, RoundedRectangleBorder, Row, Scaffold, SizedBox, StatelessWidget, Text, TextAlign, TextStyle, Theme, Widget;

class ECommerceScreenBefore extends StatelessWidget{
  const ECommerceScreenBefore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _buildToggleBar(context),
            Image.asset('assets/woman_shopping.jpg'),
            DealButtons(),
            _buildProductTile(context)
          ]
        )
      ) 
    );
  }

  Container _buildProductTile(BuildContext context) {
    return Container(
            height: 200,
            color: Theme.of(context).cardColor,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/textiles.jpg',
                  fit: BoxFit.fitHeight
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Lorem Ipsum',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Dolor sit amet, consectetur adipiscing elit. Quisque faucibus.'
                        )
                      ]
                    )
                  )
                )
              ]
            )
          );
  }

  Row _buildToggleBar(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildToggleItem(context, 'Recommended', selected: true),
        _buildToggleItem(context, 'Casual Wear'),
        _buildToggleItem(context, 'Formal Wear')
      ]
    );
  }

  Padding _buildToggleItem(BuildContext context, String text, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? null : Theme.of(context).textTheme.titleMedium?.color?.withOpacity(0.5),
          fontSize: 17,
          fontWeight: selected ? FontWeight.bold : null
        )
      )
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
      ),
      leading: Padding(
        padding: const EdgeInsets.all(20),
        child: Icon(Icons.home)
      ),
      title: Text("Let's go shopping!"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Icon(Icons.shopping_cart)
        )
      ]
    );
  }
}

class DealButtons extends StatelessWidget {
  const DealButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            DealButton(
              text: 'Best Sellers', 
              color: Colors.orangeAccent
            ),
            SizedBox(width: 10),
            DealButton(
              text: 'Daily Deals',
              color: Colors.blue
            )
          ]
        ),
        SizedBox(height: 15),
        Row(
          children: <Widget>[
            DealButton(
              text: 'Must Buy in Summer',
              color: Colors.lightGreen
            ),
            SizedBox(width: 10),
            DealButton(
              text: 'Last Chance',
              color: Colors.redAccent
            )
          ]
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class DealButton extends StatelessWidget {
  final String text;
  final Color? color;
  
  const DealButton({
    super.key,
    this.text = "",
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          )
        )
      ) 
    );
  }
}