/*
 * If you want to model groups of similar data, collections are your solution.
 * A collection contains a group of elements.
 * There are many types of collection in Dart, but the most common are:
 * 
 * Lists: Linear collections where the order of the lements is maintained.
 *  List equivalent in other languages:
 *  ArrayList (Java)
 *  Array (JavaScript)
 *  Array (Swift)
 * 
 * Maps: Non-linear collections of values that can be accessed by a unique key.
 *  Map equivalent in other languages:
 *  HashMap (Java)
 *  Object (JavaScript)
 *  Dictionary (Swift)
 * 
 * Sets: Non-linear collections of unique values where the order is not maintained.
 *  Set equivalent in other languages:
 *  HashSet (Java)
 *  Set (JavaScript)
 *  Set (Swift)
 * 
 * One thing these collections have in common is subscript syntax.
 * Subscripts are a way to quickly access elements in a collection, and they tend to work identically from language to language:
 * numbers[1] = 15; 
 * The preceding line assigns the second value in the numbers list to 15.
 */
void collectionPlayground() {
  listPlayground();
  mapPlayground();
  setPlayground();
  collectionControlFlow();
}


/*
This function shows how to declare, add, and remove data from a list.
Sometimes, it is safer to use the first and last accessors on the list instead of accessing the element directly:
final firstElement = numbers.first;
final lastElement = numbers.last;
Note that if your set is empty, first and last will throw an exception as well
*/
void listPlayground() {
  final List<int> numbers = [1, 2, 3, 5, 7]; // Creating with list literal syntax

  numbers.add(10); // Adding an element to the end of the list
  numbers.addAll([4, 1, 35]); // Adding multiple elements to the end of the list

  numbers[1] =  15; // Assigning via subscript

  print('The second number is ${numbers[1]}'); // Outputs: The second number is 15

  for (int number in numbers) { // Enumerating a list
    print(number);
  }
}


/*
Maps store two points of data per element – a key and a value.
Keys are used to write and retrieve the values stored in the list.
Unlike arrays, if you try to access a value with a key that is not on the map, then it will just gracefully fail and return null. It will not throw an exception.
*/
void mapPlayground() {
  final Map<String, int> ages = { // Map literal syntax
    'Mike': 18,
    'Peter': 35,
    'Jennifer': 26,
  };

  ages['Tom'] = 48; // Subscript syntax uses the key type, so a String in this case

  final ageOfPeter = ages['Peter']; // Subscript syntax returns the value type, so an int in this case
  print('Peter is $ageOfPeter years old'); // Outputs: Peter is 35 years old

  ages.remove('Peter'); // Removing an element from the map

  ages.forEach((String name, int age) { // Enumerating a map
    print('$name is $age years old');
  });
}


/*
Sets are the least common collection type, but still very useful.
They are used to store values where the order is not important and duplicates are not allowed.
Since sets require elements to be unique and they don't have to maintain an explicit order, they can be significantly faster than lists.
*/
void setPlayground() {
  final Set<String> ministers = { // Set literal, similar to a Map but without the key-value pair
    'Justin',
    'Stephen',
    'Paul',
    'Jean',
    'Kim',
    'Brian'
  };

  ministers.addAll({'John', 'Pierre', 'Joe', 'Pierre'}); // Pierre is a duplicate, which is ignored

  final isJustinAMinister = ministers.contains('Justin'); // Check if a value is in the set
  print(isJustinAMinister); // Outputs: true

  for (String primeMinister in ministers) { // Enumerating a set (Pierre will only be printed once)
    print('$primeMinister is a Prime Minister');
  }
}


/*
You can include if statements, for loops, and spread operators directly inside your collection declarations.
These operators work mostly like their normal control flow counterparts, except you do not add brackets and you only get a single line to yield a new value in the collection.
However, the single line requirement can be very restrictive, so Dart has also borrowed the spread operator from JavaScript.
By putting the three dots before the sublist, Dart will unbox the second list and flatten all these numbers into a single list.
You can use this technique to add more than one value inside a collection-if or collection-for statement.
Spread operators can also be used anywhere you wish to merge lists; they are not limited to collection-if and collection-for.
We will be using this style of syntax extensively when we get to Flutter.
*/
void collectionControlFlow() {
  final addMore = false;
  final randomNumbers = [
    34,
    232,
    54,
    32,
    if (addMore) ... [ // Spread operator
      534343,
      4423,
      3432432,
    ],
  ];

  final duplicated = [
    for (int number in randomNumbers) number * 2,
  ];

  print(duplicated); // Outputs: [68, 464, 108, 64]
}