import 'package:flutter/material.dart';

class PayableItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool bold;
  const PayableItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: bold ? 18.0 : 16.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: bold ? 18.0 : 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
