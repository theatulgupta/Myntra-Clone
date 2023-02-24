import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra_clone/home_page.dart';
import 'package:myntra_clone/pages/cart_page.dart';
import 'package:myntra_clone/pages/notifications_page.dart';
import 'package:myntra_clone/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Myntra Clone",
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          useMaterial3: true,
          fontFamily: GoogleFonts.lato().fontFamily),
      initialRoute: MyntraRoutes.homeRoute,
      routes: {
        MyntraRoutes.homeRoute: (context) => const HomePage(),
        MyntraRoutes.cartRoute: (context) => const CartPage(),
        MyntraRoutes.notificationsRoute: (context) => const NotificationsPage()
      },
    );
  }
}
