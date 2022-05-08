import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_pagination/pagination_button/pagination_button.dart';

class CustomPagination extends StatefulWidget {
  const CustomPagination({Key? key}) : super(key: key);

  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          PaginationButton(icon: Icon(Icons.keyboard_double_arrow_left, color: Color(ThemeProvider.theme["darkGreen"]), size: 27,)),
          PaginationButton(icon: Icon(Icons.keyboard_arrow_left, color: Color(ThemeProvider.theme["darkGreen"]), size: 27,)),
          PaginationButton(
              text: Text(
                  "1",
                  style: TextStyle(
                      color: Color(ThemeProvider.theme["darkGreen"]),
                      fontWeight: FontWeight.w900,
                      fontSize: 16
                  )
              )
          ),
          PaginationButton(
            text: Text(
              "2",
              style: TextStyle(
                color: Color(ThemeProvider.theme["darkGreen"]),
                fontWeight: FontWeight.w900,
                fontSize: 16
              )
            )
          ),
          PaginationButton(
            text: Text(
              "3",
              style: TextStyle(
                color: Color(ThemeProvider.theme["darkGreen"]),
                fontWeight: FontWeight.w900,
                fontSize: 16
              )
            )
          ),
          PaginationButton(icon: Icon(Icons.keyboard_arrow_right, color: Color(ThemeProvider.theme["darkGreen"]), size: 27)),
          PaginationButton(icon: Icon(Icons.keyboard_double_arrow_right, color: Color(ThemeProvider.theme["darkGreen"]), size: 27)),
        ],
      ),
    );
  }
}
