import 'package:flutter/material.dart';
import '../src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      );
    }

    // the StreamBuilder takes in a stream and a method called 'builder'
    // anytime the StreamBuilder sees a new event from this stream its going to invoke the 'builder' method and attempt to re-render itself on the screen
    // antyime the stream changes, the builder function reruns, a new widget is returned and that new widget is displayed on the screen 
    // the 'snapshot' property contains whatever information that came across the stream
    Widget emailField() {
      return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (newValue) {
              bloc.changeEmail(newValue);
            }, 
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error,
            ),
          );
        },
      ); 
    }

    Widget passwordField() {
      return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (newValue) {
              bloc.changePassword(newValue);
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        },
      );

      
    }

    Widget submitButton() {
      return RaisedButton(
        onPressed: (){},
        child: Text('Login'),
        color: Colors.blue,
      );
    }
}