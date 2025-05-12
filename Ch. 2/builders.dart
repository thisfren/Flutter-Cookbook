/*
 * Builders are a type of class whose only purpose is to build other classes.
 * They are often used for complex objects with many properties.
 * It can get to a point where standard constructors become impractical and unwieldy because they are too large.
 * This is the problem the builder pattern solves.
 * It is a special kind of class whose only job is to configure and create other classes.
 */

class UrlBuilder {
  late String _scheme;
  late String _host;
  late String _path;

  UrlBuilder setScheme(String value) {
    _scheme = value;
    return this;  
  }

  UrlBuilder setHost(String value) {
    _host = value;
    return this;  
  }

  UrlBuilder setPath(String value) {
    _path = value;
    return this;  
  }

  String build() {
    assert(_scheme != null);
    assert(_host != null);
    assert(_path != null);

    return '$_scheme://$_host/$_path';
  }
}


/*
This is very verbose. 
Dart can implement this pattern without any setup.
*/
void main() {
  final url = UrlBuilder()
    .setScheme('https')
    .setHost('dart.dev')
    .setPath('/guides/language/language-tour#cascade-notation-')
    .build();

  print(url); // Outputs: https://www.example.com/path/to/resource
}