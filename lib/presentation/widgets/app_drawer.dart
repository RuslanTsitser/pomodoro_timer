import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/presentation/widgets/drawer_title.dart';
import 'package:pomodoro_timer/presentation/widgets/menu_item.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int? selectedItem;

  final List<List<String>> menuItems = [
    ['Home', 'assets/icons/home.png'],
    ['Success', 'assets/icons/success.png'],
    ['Settings', 'assets/icons/setting.png'],
    ['Review', 'assets/icons/review.png'],
    ['Promt', 'assets/icons/promt.png'],
    ['Share this', 'assets/icons/share_this.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Drawer(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            tileMode: TileMode.mirror,
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/pictures/menu.png',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 78),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    child: const DrawerTitle(title: 'INSTRUMENTS'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.red,
                          child: MenuItem(
                            imagePath: menuItems[index].last,
                            name: menuItems[index].first,
                            selected: index == selectedItem ? true : false,
                            onTap: () {
                              setState(() {
                                selectedItem = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
