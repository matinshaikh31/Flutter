import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/ui/auth/login_with_phonenumber.dart';
import 'package:flutterfirebase/ui/auth/singup_screen.dart';
import 'package:flutterfirebase/ui/post/post_screen.dart';
import 'package:flutterfirebase/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString().trim(),
              password: passwordController.text.toString().trim())
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value.user!.email.toString())));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostScreen(),
            ));
        setState(() {
          loading = false;
        });
      }).onError((error, StackTrace) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.lock_open),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required";
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            RoundedButton(
              title: "Login",
              loading: loading,
              onTap: () {
                login();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Don't have account?."),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingupScreen()));
                },
                child: Text("SingUp")),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWithPhonenumber(),
                    ));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text("Login With Phone"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
