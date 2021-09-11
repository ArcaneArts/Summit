import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Login extends StatefulWidget {
  final form = FormGroup({
    "email": FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    "password": FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
  });

  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: widget.form,
        child: Column(
          children: <Widget>[
            ReactiveTextField(
              formControlName: "email",
              decoration: InputDecoration(labelText: "Email"),
            )
          ],
        ),
      ),
    );
  }
}
