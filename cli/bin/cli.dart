import 'dart:mirrors';

void main(List<String> arguments) {
  var currentLibrary = currentMirrorSystem().isolate.rootLibrary;
  print("I run in standalone dart, can use mirrors: ${currentLibrary.uri}");
}
