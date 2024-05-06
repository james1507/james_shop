import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/flavors/flavors.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/firebase_options.dart';

void buildFlavor(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjections();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  F.appFlavor = flavor;
  runApp(const App());
}
