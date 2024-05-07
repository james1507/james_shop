import 'package:flutter/material.dart';
import 'package:james_shop/core/style/app_colors.dart';

class AuthAppbar extends StatelessWidget {
  final String? title;
  final Widget? child;

  const AuthAppbar({
    super.key,
    this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: AppColors.transparent,
          surfaceTintColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.onPrimary,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: theme.primaryColor),
            ),
          ),
          leadingWidth: 65,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          pinned: true,
          floating: true,
          expandedHeight: size.height / 4,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 24, bottom: 12),
            title: Text(
              title ?? "",
              style: theme.textTheme.displaySmall!.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }
}
