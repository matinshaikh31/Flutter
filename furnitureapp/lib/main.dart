import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/auth_cntrl.dart';
import 'package:furnitureapp/controllers/productCntrl.dart';
import 'package:furnitureapp/shared/firebase.dart';
import 'package:furnitureapp/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furnitureapp/views/login_screen.dart';
import 'package:furnitureapp/views/products_screen.dart';
import 'package:furnitureapp/views/profile_screen.dart';
import 'package:furnitureapp/views/registartion_screen.dart';
import 'package:furnitureapp/views/single_product_screen.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

void main() async {
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(Productcntrl());
    Get.put(AuthCntrl());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    redirect: (context, state) {
      print("objectwieofowefjwioef");
      print(state.uri.path);
      if (FBAuth.auth.currentUser != null && state.uri.path == "/login") {
        return "/profile";
      }
      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/products",
        builder: (context, state) => ProductsScreen(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: "/profile",
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => RegistartionScreen(),
      ),
      GoRoute(
        path: "/products/:id",
        builder: (context, state) {
          final String id = state.pathParameters['id']!;
          return SingleProductScreen(id: id);
        },
      ),
    ],
  );
}
