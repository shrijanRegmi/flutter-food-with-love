import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveCarousel extends StatefulWidget {
  final List<String?> imgUrls;
  const FoodWithLoveCarousel({
    required this.imgUrls,
    Key? key,
  }) : super(key: key);

  @override
  _FoodWithLoveCarouselState createState() => _FoodWithLoveCarouselState();
}

class _FoodWithLoveCarouselState extends State<FoodWithLoveCarousel> {
  int _activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgUrls.length,
          itemBuilder: (context, index, index2) {
            return CachedNetworkImage(
              imageUrl: '${widget.imgUrls[index]}',
            );
          },
          options: CarouselOptions(
            onPageChanged: (val, reason) =>
                setState(() => _activeImageIndex = val),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        _imgIndicator(),
      ],
    );
  }

  Widget _imgIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.imgUrls.length; i++)
          Container(
            width: _activeImageIndex == i ? 25.0 : 6.0,
            margin: const EdgeInsets.only(right: 5.0),
            height: 6.0,
            decoration: BoxDecoration(
              color: kcLightBlack,
              borderRadius: BorderRadius.circular(20.0),
            ),
          )
      ],
    );
  }
}
