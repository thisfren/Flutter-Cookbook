import 'classes.dart' show Name; // For this example, we will use the Name class, which we implemented in a previous section of this chapter

List<Map> data = [
  {'first': 'Nada', 'last': 'Mueller', 'age': 10},
  {'first': 'Kurt', 'last': 'Gibbons', 'age': 9},
  {'first': 'Natalya', 'last': 'Compton', 'age': 15},
  {'first': 'Kaycee', 'last': 'Grant', 'age': 20},
  {'first': 'Kody', 'last': 'Ali', 'age': 17},
  {'first': 'Rhodri', 'last': 'Marshall', 'age': 30},
  {'first': 'Kali', 'last': 'Fleming', 'age': 9},
  {'first': 'Steve', 'last': 'Goulding', 'age': 32},
  {'first': 'Ivie', 'last': 'Haworth', 'age': 14},
  {'first': 'Anisha', 'last': 'Bourne', 'age': 40},
  {'first': 'Dominique', 'last': 'Madden', 'age': 31},
  {'first': 'Kornelia', 'last': 'Bass', 'age': 20},
  {'first': 'Saad', 'last': 'Feeney', 'age': 2},
  {'first': 'Eric', 'last': 'Lindsey', 'age': 51},
  {'first': 'Anushka', 'last': 'Harding', 'age': 23},
  {'first': 'Samiya', 'last': 'Allen', 'age': 18},
  {'first': 'Rabia', 'last': 'Merrill', 'age': 6},
  {'first': 'Safwan', 'last': 'Schaefer', 'age': 41},
  {'first': 'Celeste', 'last': 'Aldred', 'age': 34},
  {'first': 'Taio', 'last': 'Mathews', 'age': 17},
];  // You can create a global variable by adding it to the top of the file where you are working

void higherOderFunctions() {
  final names = mapping();

  names.forEach(print);
  sorting();
  filtering();
  reducing();
  flattening();
}


/*
The first higher-oder function is map.
Its purpose is taking data in one format and quickly outputting it in another format.
Map expects you to take the data element as the input of your function and then transform it into something else.
It is very common to map some JSON data that your app received from an API to a strongly typed Dart object.
When you need to parse complex graphs of data, these techniques can save you a lot of work and time.
In this example, we're going to use the map function to transform the raw Map of key-value pairs into a list of strongly typed Names.
*/
List<Name> mapping() {
  final names = data.map<Name>((Map rawName) {  // Transform the data from raw maps to a strongly typed model
    final first = rawName['first'];
    final last = rawName['last'];

    return Name(first, last);
  }).toList();

  return names;
}


/*
Now that the data is strongly typed, we can take advantage of the known schema to sort the list of names.
Sort in Dart is a mutable function, which is to say, it alters the original data.
Pure functions are supposed to simply return new data, so this one is an exception.
A sort function follows this signature:
int sortPredicate<T>(T elementA, T elementB);
The function will get two elements in the collection and it is expected to return an integer to help Dart figure out the correct order:
  -1 (A < B)
  0 (A == B)
  1 (A > B)
In this example, we are sorting the list of names by last name.
*/
void sorting() {
  final names = mapping();

  names.sort((a, b) => a.last.compareTo(b.last)); // Alphabetize the list by last name

  print('');
  print('Alphabetical list of names:');
  names.forEach(print);
}


/*
Another common task that can be succinctly solved with higher-order functions is filtering.
There are several cases where you or your users are only interested in a subset of your data.
In these cases, you can use the where() function to filter your data.

where() is not the only function that filters data. There are a few others, such as:
firstWhere(),
lastWhere(),
singleWhere(),
indexWhere(),
removeWhere(),
which all accept the same sort of predicate function.

The following higher-order function will return a new list of names that match a certain criteria.
*/
void filtering() {
  final names = mapping();
  final onlyM = names.where((name) => name.last.startsWith('M'));

  print('');
  print('Names filtered by M:');
  /*
  This pattern dictates that functions can be treated just like any other variable. 
  They can be stored as closures or even passed around to different functions.
  */
  onlyM.forEach(print); // Implements a pattern called first-class functions
}


/*
Reducing a list is the act of deriving a single value from the entire collection.
For a list of numbers, you might want to use the reduce function to quickly calculate the sum of those numbers.
For a list of strings, you can use reduce to concatenate all the values.
A reduce function will provide two parameters, the previous result, and the current elements.

Dart also provides alternative implementations of reduce that you may want to use.
The fold() function allows you to provide an initial value for the reducer.
This is helpful for non-numeric types such as strings or if you do not want your code to start reducing from 0:
final oddTotal = allAges.fold<int>(-1000, (total, age) => total + age);

In this example, we're going to reduce to calculate the age average of all the people on the list.
The first time this function runs, the total value will be 0.
The function will return 0 plus the first age value, 10.
In the second iteration, the total value will 10. That function will then return 10 + 9.
This process will continue until all the elements have been added to the total value.
*/
void reducing() {
  final allAges = data.map<int>((person) => person['age']);
  final totalAge = allAges.reduce((total, age) => total + age);
  final averageAge = totalAge / allAges.length;

  print('');
  print('The average age is $averageAge');
}


/*
The final tool solves the problem you may encounter when you have collections nested within collections and need to remove some of that nesting.
The purpose of the expand() function is to look for nested collections inside your collection and flatten them into a single list.
This is useful when you need to start manipulating nested data structures, such as a matrix or a tree.
There, you will often need to flatten the collection as a data preparation step, before you can extract useful insights from the values.

This function shows how we can take a 2D matrix and flatten it into a single linear list.
In this example, every element in the matrix list is another list.
The expand function will loop through every element, and if the function returns a collection, it will destructure that collection into a linear list of values.
*/
void flattening() {
  final matrix = [
    [1, 0, 0],
    [0, 0, -1],
    [0, 1, 0],
  ];
  final linear = matrix.expand<int>((row) => row);
  
  print(linear);
}


/*
 * If you inspected the source code of the map and where functions, you probably noticed that the return type of these functions is not a List, but another type called Iterable.
 * This abstract class represents an intermediary state before you decide what concrete data type you want to store. It doesn't necessarily have to be a List.
 * You can also convert your iterable into a Set if you want.
 * The advantage of using iterables is that they are lazy. 
 * Programming is one of the only professions where laziness is a virtue.
 * In this context, laziness means that the function will only be executed when it's needed, not earlier.
 * This means that we can take multiple higher-order functions and chain them together, without stressing the processor with unnecessary cycles.
 * We could reduce the sample code even further and add more functions for good measure:
 * final names = data
 *  .map<Name>((raw) => Name(raw['first'], raw['last']))
 *  .where((name) => name.last.startsWith('M'))
 *  .where((name) => name.first.length > 5)
 *  .toList(growable: false);
 * Each of these functions is cached in our Iterable and only runs when you make the call to toList().
 * Here, you are serializing the data in a model, checking whether the last name starts with M, and then checking whether the first name is longer than five letters.
 * This is executed in a single iteration through the list!
 */