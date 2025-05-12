/*
 * Dart Strings Playground
 * This file contains examples of string declarations, multi-line strings, and combining strings in Dart.
 */

/*
Use this as the hub for all the other string examples.
*/
void stringPlayground() {
  basicStringDeclaration();
  multiLineStrings();
  combiningStrings();
}


/*
The first section demonstrates the ways in which you can declare string literals.
The two ways in which you can write a string are helpful when you're writing strings that contain single quotes/apostrophes or quotation marks.
If you declare your string with the symbol that is not in your string, then you will not have to add any unnecessary characters to your code, which ultimately improves legibility.
It has become a convention to prefer single quote strings over doubles in Dart, which is what we will follow in this book, except if that choice forces us to add escape characters.
*/
void basicStringDeclaration() {
  // With single quotes
  print('Single quotes');
  final aBoldStatement = 'Dart isn\'t loosely typed';
  print(aBoldStatement);

  // With double quotes
  print("Hello, world!");
  final aMoreMildOpinion = "Dart's popularity has skyrocketed with Flutter!";
  print(aMoreMildOpinion);

  // Combining single and double quotes
  final aMixAndMatch = 'Every programmer should write "Hello, World" when learning a new language.';
  print(aMixAndMatch);
}


/* 
Dart also supports multi-line strings for cases where you have a text block that you want to print to the screen.
If you ever had a larger block of text that you didn't want to put into a single line, you would have to insert the newline character, \n, as you see in this recipe's code:
final withEscaping = 'One Fish\nTwo Fish\nRed Fish\nBlue Fish';
The newline character has served us well for many years, but more recently, another option has emerged.
If you write three quotation marks (single or double), Dart will allow you to write free-form text without having to inject any non-rendering control characters.
*/
void multiLineStrings() {
  final withEscaping = 'One Fish\nTwo Fish\nRed Fish\nBlue Fish';
  print(withEscaping);

  final hamlet = '''
  To be, or not to be, that is the question:
  Whether 'tis nobler in the mind to suffer
  The slings and arrows of outrageous fortune,
  Or to take arms against a sea of troubles,
  And by opposing end them.
  ''';

  print(hamlet);
}


/*
Finally, one of the most common tasks programmers perform with strings is composing them to make more complex strings.
On top of simply declaring strings, the more common use of this data type is to concatenate multiple values to build complex statements.
*/
void combiningStrings() {
  traditionConcatenation();
  modernInterpolation();
}


/*
Dart supports the traditional way of concatenating strings; that is, by simply using the addition (+) symbol between multiple strings.
*/
void traditionConcatenation() {
  final hello = 'Hello';
  final world = "World";

  final combined = hello + ' ' + world;
  print(combined); // Outputs: Hello World
}


/*
However, it also supports a more modern way of doing this, which is called string interpolation.
String interpolation is a way of embedding variables and expressions inside string literals.
The dollar sign notation only works for single values, such as the integer in the preceding snippet.
If you need anything more complex, you can add curly brackets after the dollar sign and write any Dart expression.
This can range from something simple, such as accessing a member of a class, to a complex ternary operator.
*/
void modernInterpolation() {
  final year = 2011;
  final interpolated = 'Dart was first released in $year.';
  print(interpolated); // Outputs: Dart was first released in 2011.

  final age = 35;
  final howOld = 'I am $age ${age == 1 ? 'year' : 'years'} old.';
  print(howOld); // Outputs: I am 35 years old.
}