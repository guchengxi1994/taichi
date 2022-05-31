// ignore_for_file: avoid_print

import 'dart:mirrors';

// ignore: camel_case_types
class todo {
  final String who;
  final String what;

  const todo(this.who, this.what);
}

@todo('akira', 'add something')
class Foo {
  @todo('naoto', 'do something')
  String fooVariable = 'a';

  @todo('kitano', 'change the name')
  void fooMethod() {}
}

void main() {
  final InstanceMirror im = reflect(Foo());
  final ClassMirror classMirror = im.type;

  // ClassMirror
  for (final metadata in classMirror.metadata) {
    print((metadata.reflectee as todo).who); // -> akira
    print((metadata.reflectee as todo).what); // -> add something
  }

  // VariableMirror
  for (final variable in classMirror.typeArguments) {
    print(variable.metadata.first.reflectee.toString()); // -> naoto
    print(variable.metadata.first.reflectee.toString()); // -> do something
  }

  // MethodMirror
  classMirror.declarations.values
      .map((e) => print(e.metadata.first.reflectee.toString()));
}
