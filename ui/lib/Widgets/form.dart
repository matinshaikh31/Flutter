import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String selectedvalue = 'Orange';
  @override
  Widget build(BuildContext context) {
    String firstName = "";
    String lastName = "";
    String email = "";
    String password = "";
    final formKey = GlobalKey<FormState>();

    submitForm() {
      print(firstName);
      print(lastName);
      print(email);
      print(password);
    }

    trySubmit() {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        formKey.currentState!.save();
        submitForm();
      } else
        print("Error");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Form  List'),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "Enter your firts name"),
                  key: ValueKey("firstName"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "First Name should not empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    firstName = value.toString();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter your last name"),
                  key: ValueKey("lastName"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Last Name should not empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lastName = value.toString();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter your email "),
                  key: ValueKey("email"),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "email  should not empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter your password"),
                  key: ValueKey("password"),
                  validator: (value) {
                    if (value.toString().length <= 5) {
                      return "password should not empty";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    password = value.toString();
                  },
                ),
                TextButton(
                    onPressed: () {
                      trySubmit();
                    },
                    child: Text("Submit"))
              ],
            )),
      )),
    );
  }
}
