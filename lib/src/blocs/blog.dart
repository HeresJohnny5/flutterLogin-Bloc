import 'package:flutter/material.dart';
import 'dart:async'; // asynchronous alternative: Future and Stream

class Bloc {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();
}