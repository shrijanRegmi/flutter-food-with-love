import 'package:flutter/material.dart';
import 'package:food_with_love/src/shared/app_colors.dart';

class FoodWithLoveSearchBar extends StatelessWidget {
  final TextEditingController? searchController;
  final bool autoFocus;
  final Function()? onPressed;

  const FoodWithLoveSearchBar({
    Key? key,
    this.searchController,
    this.autoFocus = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3.0, 3.0),
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autofocus: autoFocus,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textCapitalization: TextCapitalization.words,
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What are you searching ?',
                    contentPadding: const EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: kcPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            width: 45.0,
            height: 45.0,
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: kcPrimaryColor,
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
