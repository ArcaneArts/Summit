import 'package:app/summit_icons.dart';
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
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(
              flex: 5,
            ),
            Icon(
              SummitIcon.icon,
              size: height / 5,
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.all(14),
              child: SizedBox(
                width: width / 1.45,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: ReactiveForm(
                      formGroup: widget.form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ReactiveTextField(
                            formControlName: "email",
                            decoration: InputDecoration(labelText: "Email"),
                          ),
                          ReactiveTextField(
                            formControlName: "password",
                            decoration: InputDecoration(labelText: "Password"),
                            obscureText: true,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}
