import 'package:flutter/material.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/core/flavors/flavors.dart';
import 'package:james_shop/core/utils/injections.dart';

void buildFlavor(Flavor flavor) {
  WidgetsFlutterBinding.ensureInitialized();
  initInjections();

  F.appFlavor = flavor;
  runApp(const App());
}
