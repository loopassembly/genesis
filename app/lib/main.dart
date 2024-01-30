import 'package:app/screens/details_page.dart';
import 'package:app/screens/forms_screen.dart';
import 'package:app/screens/login_page.dart';
import 'package:flutter/material.dart';

// Third party imports
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

//screens/widgets
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(1, 12, 6, 6),
        textTheme: GoogleFonts.spaceGroteskTextTheme().copyWith(
          titleLarge: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w400,
            fontSize: 64,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          bodyMedium: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w400,
            fontSize: 39.75,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          bodySmall: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const MyHomePage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/detail",
          builder: (context, state) => const DetailsPage(),
        ),
        GoRoute(
          path: "/form",
          builder: (context, state) => const FormsScreen(),
        )
      ]),
    );
  }
}
