import 'dart:async';
import 'bloc.dart';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers( // the first argument String is the input type of data, whereas the second argument String is the output type
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valide email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers( 
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Enter a password that is 6 or more characters.');
      }
    }
  );
}