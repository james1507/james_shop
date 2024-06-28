import 'package:flutter/material.dart';
import 'package:james_shop/core/router/app_route_enum.dart';
import 'package:james_shop/core/utils/injections.dart';
import 'package:james_shop/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:james_shop/features/home/presentation/widgets/search_input_widget.dart';
import 'package:james_shop/features/home/presentation/widgets/special_offers_widget.dart';
import 'package:james_shop/shared/data/data_sources/app_shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets edgeInsets = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: edgeInsets.top + 24,
          bottom: edgeInsets.bottom,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            HomeAppBarWidget(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcEPHZ1j_Lw71fvoJAj_rgrB98GvssDISTOBHNBlMTTjI6Fp9EGV_LsmmvoN1I1ExQCD8&usqp=CAU",
              onPressedProfile: () {},
              onPressedHeart: () {},
              onPressedNotification: () {},
            ),
            const SizedBox(height: 24),
            const SearchInputWidget(),
            const SizedBox(height: 24),
            const SpecialOffersWidget(),
          ],
        ),
      ),
    );
  }
}

// sl<AppSharedPrefs>().setUser(null);
// Navigator.of(context).pushNamedAndRemoveUntil(
//     AppRouteEnum.accountAuthPage.name, (route) => false);