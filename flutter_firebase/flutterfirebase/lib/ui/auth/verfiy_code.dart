import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/ui/auth/verfiy_code.dart';
import 'package:flutterfirebase/ui/post/post_screen.dart';
import 'package:flutterfirebase/widgets/rounded_button.dart';

class VerfiyCode extends StatefulWidget {
  final String verificationId;
  const VerfiyCode({required this.verificationId, super.key});
  @override
  State<VerfiyCode> createState() => _VerfiyCodeState();
}

class _VerfiyCodeState extends State<VerfiyCode> {
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
              decoration: InputDecoration(hintText: "6 digits code"),
            ),
            SizedBox(
              height: 80,
            ),
            RoundedButton(
              title: "Verfiy",
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: phoneNumberController.text.toString());

                try {
                  await auth.signInWithCredential(credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(),
                      ));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
