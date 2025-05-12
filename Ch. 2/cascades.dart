/*
 * There are some features that are unique to Dart. One of those features is the cascade (..) operator.
 * In this example, we are going to optimize the builders.dart code with it.
 * The cascade operator allows you to call multiple methods on the same object without having to repeat the object name.
 */
void cascadePlayground() {
  final url = UrlBuilder()
    ..scheme = 'https'
    ..host = 'dart.dev'
    ..routes = [
      'guides',
      'language',
      'language-tour#cascade-notation-'
    ];
  print(url);

  final numbers = [342, 23423, 53, 232, 534]
    ..insert(0, 10)
    ..sort((a, b) => a.compareTo(b));
  print('The largest number in the list is ${numbers.last}');
}
/*
Both the insert and sort methods are void functions.
Declaring these objects with cascades simply allows you to remove the call to the numbers object.
With the cascade operator, you can merge unrelated statements in a simple fluent chain of function calls.
*/


class UrlBuilder {
  late String scheme;
  late String host;
  late List<String> routes;

  @override
  String toString() {
    assert(scheme != null);
    assert(host != null);
    assert(routes != null);

    final paths = [host, if (routes != null) ...routes];
    final path = paths.join('/');

    return '$scheme://$path';
  }
}

