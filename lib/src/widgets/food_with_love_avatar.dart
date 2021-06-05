import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/enums/avatar_style.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveAvatar extends StatelessWidget {
  final String photoUrl;
  final double? size;
  final Color? bgColor;
  final AvatarStyle? avatarStyle;
  final BoxBorder? border;
  final BoxShadow? shadow;

  FoodWithLoveAvatar.normal({
    required this.photoUrl,
    this.size = 60.0,
    this.bgColor = kcExtraLightGreyColor,
    this.shadow,
  })  : avatarStyle = AvatarStyle.normal,
        border = null;

  const FoodWithLoveAvatar.bordered({
    required this.photoUrl,
    this.size = 60.0,
    this.bgColor = kcExtraLightGreyColor,
    this.border,
    this.shadow,
  }) : avatarStyle = AvatarStyle.bordered;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: avatarStyle == AvatarStyle.bordered
            ? border ??
                Border.all(
                  color: Colors.white,
                  width: 5.0,
                )
            : null,
        boxShadow: shadow != null ? [shadow ?? BoxShadow()] : null,
        image: DecorationImage(
          image: CachedNetworkImageProvider(photoUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
