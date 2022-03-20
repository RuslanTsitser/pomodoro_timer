import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: InkWell(
        child: Image.asset('assets/icons/menu.png'),
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
