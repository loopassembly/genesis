import 'package:app/new_home_page.dart/add_id.dart';
import 'package:app/new_home_page.dart/your_id_page.dart';
import 'package:app/screens/details_page.dart';
import 'package:app/screens/forms_screen.dart';
import 'package:app/screens/login_page.dart';
import 'package:app/screens/notice_page.dart';
import 'package:app/screens/file_upload.dart';
import 'package:app/screens/user_ids.dart';
import 'package:app/theme/pallete.dart';
import 'package:app/widgets/email_field.dart';
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
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Pallete.darkModeAppTheme,
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) =>
              // const FormsScreen(
              //       email: "aeasdgas",
              //     )

              // const MyHomePage()

              // const FileUploadPage()

              // const UserIdsPage()

              // const LoginScreen()

              // const CustomTextField()

              // NoticePage(
              //   email: 'ashutoshanand2560@gmail.com',
              // )

              DetailsPage(
            token: "token",
          ),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginScreen(),
        ),
        // GoRoute(
        //   path: "/detail",
        //   builder: (context, state) => const DetailsPage(),
        // ),
        // GoRoute(
        //   path: "/form",
        //   builder: (context, state) => const FormsScreen(email: "email",),
        // )
      ]),
    );
  }
}
