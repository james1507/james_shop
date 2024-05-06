import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:james_shop/features/onboarding/domain/enum/tab_walkthrough_enum.dart';
import 'package:james_shop/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:james_shop/shared/presentation/widgets/app_button.dart';

class WalkthroughPage extends StatefulWidget {
  const WalkthroughPage({super.key});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage>
    with TickerProviderStateMixin {
  final _bloc = OnboardingBloc();

  @override
  void initState() {
    super.initState();

    _bloc.pageController = PageController();
    _bloc.tabController =
        TabController(length: TabWalkthroughEnum.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CurrentPageIndexState) {
            _bloc.currentPageIndex = state.currentPageIndex;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _imageWalkthrough(),
              _introContainer(),
            ],
          );
        },
      ),
    );
  }

  Widget _imageWalkthrough() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 3,
      width: size.width,
      child: PageView(
        controller: _bloc.pageController,
        scrollDirection: Axis.horizontal,
        children: TabWalkthroughEnumExtension.pages,
        onPageChanged: (value) {
          _bloc.add(ChangeCurrentIndexEvent(currentPageIndex: value));
        },
      ),
    );
  }

  Widget _introContainer() {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height / 2.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 38),
          Text(
            TabWalkthroughEnumExtension.getTitlePage(_bloc.currentPageIndex),
            style: theme.displaySmall!.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _tabAction(),
          const SizedBox(height: 40),
          _button(_bloc.currentPageIndex + 1),
        ],
      ),
    );
  }

  Widget _tabAction() {
    TabWalkthroughEnum getTab =
        TabWalkthroughEnumExtension.getTabWalkThrough(_bloc.currentPageIndex);
    final theme = Theme.of(context);

    return SizedBox(
      height: 8,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: getTab.listChoose.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: getTab.listChoose[index] ? 32 : 8,
            decoration: BoxDecoration(
              color: getTab.listChoose[index]
                  ? theme.primaryColor
                  : AppColors.greyscale300,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 6);
        },
      ),
    );
  }

  Widget _button(int index) {
    final size = MediaQuery.of(context).size;
    String getTitleButton =
        TabWalkthroughEnumExtension.getButtonTitle(_bloc.currentPageIndex);
    final theme = Theme.of(context);

    return AppButton(
      width: size.width,
      height: 58,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      buttonColor: theme.primaryColor,
      child: Text(getTitleButton),
      onPressed: () {
        if (index == TabWalkthroughEnum.values.length) {
          _bloc.add(NavigateToAccountAuthEvent());
        } else {
          _bloc.add(ChangeCurrentPageEvent(currentPageIndex: index));
        }
      },
    );
  }
}
