import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/ui/auth/verfiy_code.dart';
import 'package:flutterfirebase/widgets/rounded_button.dart';

class LoginWithPhonenumber extends StatefulWidget {
  const LoginWithPhonenumber({super.key});

  @override
  State<LoginWithPhonenumber> createState() => _LoginWithPhonenumberState();
}

class _LoginWithPhonenumberState extends State<LoginWithPhonenumber> {
  @override
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with phone number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              decoration: InputDecoration(hintText: "+91 123-456-7890"),
            ),
            SizedBox(
              height: 80,
            ),
            RoundedButton(
              title: "Login",
              onTap: () {
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (context) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                      setState(() {
                        loading = false;
                      });
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerfiyCode(
                              verificationId: verificationId,
                            ),
                          ));
                      setState(() {
                        loading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                      setState(() {
                        loading = false;
                      });
                    });
              },
              loading: loading,
            )
          ],
        ),
      ),
    );
  }
}
