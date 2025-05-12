/*
 * Generally speaking, variables that have no value are null, and this may lead to errors in the code.
 * With null safety, by default, variables cannot be assigned a null value.
 * The main reason behind the addition of null safety in Dart is that errors caused by unexpected null values are frequent and not always easy to debug.
 * Simply put, when you enable null safety, by default you cannot assign a null value to any variable, field, or parameter.
 * There are obviously cases when you want to use null, but you have to explicitly allow null values in your apps.
 * In order to make a variable, field, or parameter nullable, you can use a question mark after the type.
 */

void main() {
  int? someNumber; // This variable can be null
  increaseValue(someNumber!); // Using the null assertion operator to force the value to be non-null
}


void increaseValue(int value) {
  value = value ?? 0; // If value is null, assign it 0 (null-coalescing operator)
  value++; // Increment the value

  print(value);
}