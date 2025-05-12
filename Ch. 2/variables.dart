void variablePlayground() {
  basicTypes();
  untypedVariables();
  typeInterpolation();
  immutableVariables();
}


void basicTypes() {
  int four = 4;
  double pi = 3.14;
  num someNumber = 24601;
  bool yes = true;
  bool no = false;
  int? nothing;

  print(four);
  print(pi);
  print(someNumber);
  print(yes);
  print(no);
  print(nothing == null);
}


void untypedVariables() {
  dynamic something = 14.2;
  print(something.runtimeType); // outputs 'double'
}


void typeInterpolation() {
  var anInteger = 15;
  var aDouble = 27.6;
  var aBoolean = false;

  print(anInteger.runtimeType); // outputs 'int'
  print(anInteger);

  print(aDouble.runtimeType); // outputs 'double'
  print(aDouble);

  print(aBoolean.runtimeType); // outputs 'bool'
  print(aBoolean);
}


void immutableVariables() {
  /*
  final int immutableInteger = 45;
  final double immutableDouble = 0.015;
  */

  // Type annotation is optional
  final interpolatedInteger = 10;
  final interpolatedDouble = 72.08;

  print(interpolatedInteger); 
  print(interpolatedDouble);

  const aFullySealedVariable = true;
  print (aFullySealedVariable);
}