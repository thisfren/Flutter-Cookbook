/*
 * extends: Use this keyword with any class where you want to extend the superclass's functioniality.
 *  A class can only extend one class. Dart does not support multiple inheritance.
 * 
 * implements: You can use implements when you want to create your own implementation of another class, as all classes are implicit interfaces.
 *  When you implement a class, you do not inherit any code, just the type.
 *  You must implement all the methods and properties of the class you are implementing.
 *  A class can implement multiple classes, but it's best to keep it simple.
 * 
 * with: In Dart, a class can only extend another class.
 *  Mixins allow you to reuse a class's code in multiple class hierarchies.
 *  This means that mixins allow you to get blocks of code without needing to create subclasses.
 */
void classPlayground() {
  // Creating an instance of the Name class
  final name = OfficialName('Mr', 'Francois', 'Rabelais');
  final message = name.toString();
  print(message); // Output: Mr Francois Rabelais
}


class Name {
  final String first;
  final String last;

  const Name(this.first, this.last); // The constructor shorthand allows you to automatically assign members in constructors by simply adding the this keyword

  @override
  String toString() {
    return '$first $last';
  }
}


/*
Using the extend keyword, OfficialName inherits all the properties and methods that are available in the Name class, and may add more or override existing ones.
When the OfficialName class implements the name class, all the functions that were defined in the Name class must be implemented.
*/
class OfficialName extends Name {
  final String _title; // Private properties begin with an underscore

  const OfficialName(this._title, String first, String last)
  : super(first, last); // You can add colons after constructor to parse data or delegate to superclass constructor

  @override
  String toString() {
    return '$_title $first $last';
  }
}