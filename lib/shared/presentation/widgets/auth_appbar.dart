import 'package:flutter/material.dart';

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
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
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
