/*
 * Functions are the basic building blocks of any programming language and Dart is no different. 
 * The basic structure of a function is as follows:
 * optionalReturnType functionName(optionalType parameter1, optionalType, parameter2...) {
 *  // code
 * }
 * 
 * Dart also has some variations of this classical syntax and provides full support for:
 * optional parameters, optionally named parameters, default parameter values, annotations, closures, generators, and asynchronicity decorators.
 * This may seem like a lot to cover in one recipe, but with Dart, most of this complexity will disappear.
 */

/*
The hub function for the different features we are going to cover.
*/
void functionPlayground() {
  classicalFunctions();
  optionalParameters();
}


void printMyName(String name) {
  print('Hello $name');
}


int add(int a, int b) {
  return a + b;
}

int factorial(int number) {
  if (number <=0) {
    return 1;
  }

  return number * factorial(number - 1);
}


void classicalFunctions() {
  printMyName('Anna');
  printMyName('Michael');

  final sum = add(5, 3);
  print(sum);

  print('10 Factorial is: ${factorial(10)}');
}


/*
In Flutter, unnamed optional parameters are the most common style you will be using, especially with widgets.
If you wrap your function's parameter list in square brackets, then those parameters can be omitted without the compiler throwing errors.
*/
void unnamed([String? name, int? age]) { // The question mark after a parameter tells the Dart compiler that the parameter itself can be null.
  final actualName = name ?? 'Unknown';
  final actualAge = age ?? 0;

  print('$actualName is $actualAge years old');
}


/*
When calling a function with named parameters, you need to specify the parameter name.
You can call the parameters in any order; for example, named(greeting: 'hello!');.
*/
void named({String? greeting, String? name}) { // Dart also supports named optional parameters, with curly brackets.
  final actualGreeting = greeting ?? 'Hello';
  final actualName = name ?? 'Mystery Person';

  print('$actualGreeting, $actualName!');
}


/*
Optional parameters and optional named parameters also support default values.
If the parameter is omitted when the function is called, the default value will be used instead of null.
You can also place a set of required parameters first, followed by a list of optionals.
*/
String duplicate(String name, {int times = 1}) {
  String merged = '';

  for (int i = 0; i < times; i++) {
    merged += name;
    if (i != times - 1) {
      merged += ' ';
    }
  }

  return merged;
}


/*
Implement the playground function to show all these pieces in action.
*/
void optionalParameters() {
  unnamed('Huxley', 3); // In the first example, it isn't immediately clear what the purpose of each parameter is.
  unnamed();

  // Notice how named parameters can be in any order.
  named(greeting: 'Greetings and Salutations');
  named(name: 'Sonia');
  named(name: 'Alex', greeting: 'Bonjour');
  
  final multiply = duplicate('Mikey', times: 3); // Here, the times parameter immediately tells you that the text Mikey will be duplicated three times.
  print(multiply); // Outputs: Mikey Mikey Mikey
}