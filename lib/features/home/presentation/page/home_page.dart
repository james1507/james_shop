import 'package:flutter/material.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home page"),
            TextButton(
                onPressed: () {
                  sl<AppSharedPrefs>().setUser(null);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRouteEnum.accountAuthPage.name, (route) => false);
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
