import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';

class HomeAppBarWidget extends StatelessWidget {
  final String? imageUrl;
  final void Function()? onPressedProfile;
  final void Function()? onPressedNotification;
  final void Function()? onPressedHeart;

  const HomeAppBarWidget({
    super.key,
    this.imageUrl,
    this.onPressedProfile,
    this.onPressedNotification,
    this.onPressedHeart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _info(theme),
        _notiAndHeartAction(),
      ],
    );
  }

  Widget _info(ThemeData theme) {
    return Row(
      children: [
        _imageProfile(),
        const SizedBox(width: 16),
        _welcomeInfo(theme),
      ],
    );
  }

  Widget _imageProfile() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressedProfile,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        imageBuilder: (context, imageProvider) {
          return Ink(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
            height: 48,
            width: 48,
          );
        },
      ),
    );
  }

  Widget _welcomeInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Morning 👋",
          style: theme.textTheme.titleMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: theme.primaryColor,
          ),
        ),
        Text(
          "Andrew Ainsley",
          style: theme.textTheme.titleMedium!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _notiAndHeartAction() {
    return Row(
      children: [
        _notificationButton(),
        _heartButton(),
      ],
    );
  }

  Widget _notificationButton() {
    return IconButton(
      icon: SvgPicture.asset(AppAssets.notification),
      onPressed: onPressedNotification,
    );
  }

  Widget _heartButton() {
    return IconButton(
      icon: SvgPicture.asset(AppAssets.heart),
      onPressed: onPressedHeart,
    );
  }
}
