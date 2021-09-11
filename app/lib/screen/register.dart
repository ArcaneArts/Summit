import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Register extends StatefulWidget {
  final form = FormGroup({
    "firstName": FormControl(
      value: 'First Name',
      validators: [Validators.required],
    ),
    "lastName": FormControl(
      value: 'Last Name',
      validators: [Validators.required],
    ),
    "email": FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    "password": FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
    "passwordConfirm": FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.mustMatch("password", "passwordConfirm")
    ])
  });

  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
