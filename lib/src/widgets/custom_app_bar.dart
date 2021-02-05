import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final List<Widget> actions;
  final Widget title;
  final bool auto;
  CustomAppBar({
    @required this.title,
    @required this.actions, this.auto = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  Color.fromRGBO(18, 140, 126, 1.0),
      automaticallyImplyLeading: auto,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          color: Color(0xFFDDDDDD),
          height: 1,
        ),
      ),
      elevation: 0,
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
