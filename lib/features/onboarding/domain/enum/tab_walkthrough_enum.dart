import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';

enum TabWalkthroughEnum {
  tab1,
  tab2,
  tab3,
}

extension TabWalkthroughEnumExtension on TabWalkthroughEnum {
  List<bool> get listChoose {
    switch (this) {
      case TabWalkthroughEnum.tab1:
        return [true, false, false];
      case TabWalkthroughEnum.tab2:
        return [false, true, false];
      case TabWalkthroughEnum.tab3:
        return [false, false, true];
    }
  }

  static TabWalkthroughEnum getTabWalkThrough(int currentindex) {
    switch (currentindex) {
      case 0:
        return TabWalkthroughEnum.tab1;
      case 1:
        return TabWalkthroughEnum.tab2;
      case 2:
        return TabWalkthroughEnum.tab3;
      default:
        return TabWalkthroughEnum.tab1;
    }
  }

  static String getTitlePage(int currentindex) {
    switch (currentindex) {
      case 0:
        return lang.descriptionWalkthrough1;
      case 1:
        return lang.descriptionWalkthrough2;
      case 2:
        return lang.descriptionWalkthrough3;
      default:
        return lang.descriptionWalkthrough1;
    }
  }

  static String getButtonTitle(int currentindex) {
    switch (currentindex) {
      case 0:
        return lang.next;
      case 1:
        return lang.next;
      case 2:
        return lang.getStarted;
      default:
        return lang.next;
    }
  }

  static List<Widget> get pages {
    return [
      SvgPicture.asset(AppAssets.walkthrough1),
      SvgPicture.asset(AppAssets.walkthrough2),
      SvgPicture.asset(AppAssets.walkthrough3)
    ];
  }
}
