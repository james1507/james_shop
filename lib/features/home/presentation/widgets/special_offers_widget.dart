import 'package:flutter/material.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:james_shop/core/translations/l10n.dart';

class SpecialOffersWidget extends StatelessWidget {
  const SpecialOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        _title(theme),
        // _listSpecialOffers(theme),
        _itemSpecialOffer(theme),
      ],
    );
  }

  Widget _title(ThemeData theme) {
    return Row(
      children: [
        Text(
          lang.specialOffer,
          style: theme.textTheme.titleMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            lang.seeAll,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _listSpecialOffers(ThemeData theme) {
    return Container();
  }

  Widget _itemSpecialOffer(ThemeData theme) {
    return Container(
      height: 181,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(children: [
        
      ]),
    );
  }
}
