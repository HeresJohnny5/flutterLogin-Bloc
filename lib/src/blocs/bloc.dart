import 'dart:async'; // asynchronous alternative: Future and Stream
import 'validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // by convention a method called 'dispose' is used to cleanup different variables or objects that are created by classes in which you create
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
