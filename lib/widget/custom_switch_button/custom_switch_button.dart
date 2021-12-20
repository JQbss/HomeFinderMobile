import 'package:flutter/material.dart';
import 'package:home_finder/provider/theme/theme_provider.dart';

class CustomSwitchButton extends StatefulWidget {

  final String textLeft;
  final String textRight;
  final Function onPressedLeft;
  final Function onPressedRight;

  const CustomSwitchButton({Key? key, required this.textLeft, required this.textRight, required this.onPressedLeft, required this.onPressedRight}) : super(key: key);
  @override
  _CustomSwitchButton createState()=>_CustomSwitchButton();

}
class _CustomSwitchButton extends State<CustomSwitchButton>{

  bool isLeft=false;
  bool isRight=false;


  @override
  void initState(){
    super.initState();
  }

  void _buttonPressedLeftHandler(){
    setState(() {
      isLeft = true;
      isRight = false;
      widget.onPressedLeft();
    });
  }
  void _buttonPressedRightHandler(){
    setState(() {
      isLeft = false;
      isRight = true;
      widget.onPressedRight();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 30.0,
          left: 50.0,
          right: 50.0
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0)
                          ),
                        )
                    ),

                    backgroundColor: isLeft?MaterialStateProperty.all(Color(ThemeProvider.theme["darkGreen"])):MaterialStateProperty.all(Color(ThemeProvider.theme["lightGreen"])),
                  ),
                  onPressed: _buttonPressedLeftHandler,
                  child: Text(widget.textLeft)
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)
                          ),
                        )
                    ),
                    backgroundColor: isRight?MaterialStateProperty.all(Color(ThemeProvider.theme["darkGreen"])):MaterialStateProperty.all(Color(ThemeProvider.theme["lightGreen"])),

                  ),
                  onPressed: _buttonPressedRightHandler,
                  child: Text(widget.textRight)
              ),
            ),
          )
        ],
      ),
    );
  }



}
