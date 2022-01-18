import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class FilledAppbar extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? leading;
  final Color? bgColor;
  const FilledAppbar({
    Key? key,
    this.title,
    this.subTitle,
    this.leading,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, _statusBarHeight + 7.0, 10.0, 5.0),
      decoration: BoxDecoration(
        color: bgColor ?? kcPrimaryColor,
      ),
      child: Row(
        children: [
          leading ??
              IconButton(
                onPressed: () => Navigator.pop(context),
                iconSize: 40.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
