// lib/star.dart
/*
 * Rows, Columns, Stacks, and even Containers are just boxes.
 * Boxes will cover the majority of UIs that you would want to create, but sometimes you may need to break free from the tyranny of the quadrilateral.
 * Enter CustomPaint. Flutter has a fully featured vector drawing engine that allows you to draw pretty much whatever you want. 
 * You can then reuse these shapes in your widget tree to make your app stand out from the crowd.
 * In this recipe, we will be creating a star rating widget to see what CustomPaint is capable of.
 */


import 'package:flutter/material.dart' show BuildContext, Canvas, Color, Colors, CustomPaint, CustomPainter, EdgeInsets, Padding, Paint, Path, Row, Size, SizedBox, StatelessWidget, Widget;

class Star extends StatelessWidget {
  final Color? color;
  final double? size;

  /*
  This custom constructor is asking for a color and a size, which will then be passed down to the painter.
  This widget doesn't impose any size restrictions on the star.
  */
  const Star({
    super.key,
    this.color,
    this.size,
  });

  /*
  This build method returns a SizedBox that is constrained by this size property and then uses CustomPaint as its child.
  You can also pass the size directly into the constructor of CustomPaint if you want, but this method has been found to be more reliable.
  */
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _StarPainter(color),
      )
    );
  }
}

/*
The real work is now done in the CustomPainter subclass, which is not a widget.
CustomPainter is an abstract class, meaning you cannot instantiate it directly, as it can only be used through inheritance.
There are two methods that you have to override in the subclass:
paint and shouldRepaint.
*/
class _StarPainter extends CustomPainter {
  final Color? color;

  _StarPainter(this.color);

  /*
  The paint method is where the shape is actually drawn. You are given a Canvas object.
  From there, you can use the Path application programming interface (API) to draw the star as a vector shape.
  Since we want the star to look good at any size, instead of typing explicit coordinates for each vector point, we performed a simple calculation to draw on the percentage of the canvas instead of absolute values.
  If you only provie absolute coordinates, the shape would only be usable at a specific size.
  You will probably want to look in a program to draw your image first and then transcribe it to code:
  Sketch, Figma, or Adobe Illustrator
  */
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color!;
    final path = Path();

    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.618, size.height * 0.382);
    path.lineTo(size.width, size.height * 0.382);
    path.lineTo(size.width * 0.691, size.height * 0.618);
    path.lineTo(size.width * 0.809, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.7639);
    path.lineTo(size.width * 0.191, size.height);
    path.lineTo(size.width * 0.309, size.height * 0.618);
    path.lineTo(size.width * 0.309, size.height * 0.618);
    path.lineTo(0, size.height * 0.382);
    path.lineTo(size.width * 0.382, size.height * 0.382);

    path.close();
  
    canvas.drawPath(path, paint); // This will take the vector shape and rasterize it (convert it to pixels) using a Paint object to describe how it should be filled.
  }

  /*
  The second method, shouldRepaint, is there for optimization purposes.
  Flutter will call this method when the widget is redrawn and provide information about the old custom painter that was used to draw the image.
  In most cases, you can just return false unless you need to change the drawing, to allow Flutter to cache your image.
  */
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StarRating extends StatelessWidget {
  final Color color;
  final int value;
  final double starSize;

  const StarRating({
    super.key,
    required this.value,
    this.color = Colors.deepOrange,
    this.starSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        value,
        /*
        Every time this closure is called, the framework will be passing an index value that can be used to build the element.
        However, in this case, the index is not important.
        It's so unimportant that we don't need it at all and will never reference it in the generator closure.
        In these cases, you can replace the name of the index with an underscore (_) and that will tell Dart that we are ignoring this value, while still complying with the required API.
        */
        (_) => Padding(
          padding: const EdgeInsets.all(2),
          child: Star(
            color: color,
            size: starSize
          )
        )
      )
    );
  }
}