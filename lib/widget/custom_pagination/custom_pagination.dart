import 'package:flutter/material.dart';
import 'package:home_finder/model/pagination/pagination.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';
import 'package:home_finder/widget/custom_pagination/pagination_button/pagination_button.dart';

class CustomPagination extends StatefulWidget {
  final Pagination pagination;
  final Function changePage;
  static final GlobalKey<_CustomPaginationState> globalKey = GlobalKey();
  CustomPagination({required this.pagination,
    required this.changePage}) : super(key: globalKey);

  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {

  bool _isLeft = false;
  bool _isRight = false;
  Pagination pagination = Pagination(currentPage: 0, limit: 1, totalItems: 0, totalPages: 0);

  @override
  void initState(){
    super.initState();
    pagination=widget.pagination;
    getButtonsValues();
  }

  void getButtonsValues(){
    setState(() {
      if(pagination.currentPage>0){
        _isLeft = true;
      }else{

        _isLeft = false;
      }
      if(pagination.currentPage<(pagination.totalPages-1)){
        _isRight = true;
      }else{
        _isRight=false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          PaginationButton(
              onPress: _isLeft?()=>{widget.changePage(0)}:null,
              icon: Icon(Icons.keyboard_double_arrow_left,
              color: Color(ThemeProvider.theme["darkGreen"]),
              size: 27
            )
          ),
          PaginationButton(
              onPress: _isLeft?()=>{widget.changePage(widget.pagination.currentPage-1)}:null,
              icon: Icon(Icons.keyboard_arrow_left,
              color: Color(ThemeProvider.theme["darkGreen"]),
              size: 27,
            )
          ),
          PaginationButton(
            text: Text(
              (pagination.currentPage+1).toString(),
              style: TextStyle(
                color: Color(ThemeProvider.theme["darkGreen"]),
                fontWeight: FontWeight.w900,
                fontSize: 16
              )
            )
          ),
          PaginationButton(
            onPress: _isRight?()=>{widget.changePage(widget.pagination.currentPage+1)}:null,
            icon: Icon(Icons.keyboard_arrow_right,
            color: Color(ThemeProvider.theme["darkGreen"]),
            size: 27)
          ),
          PaginationButton(
            onPress: _isRight?()=>{widget.changePage(widget.pagination.totalPages-1)}:null,
            icon: Icon(Icons.keyboard_double_arrow_right,
            color: Color(ThemeProvider.theme["darkGreen"]),
            size: 27)
          ),
        ],
      ),
    );
  }
}
