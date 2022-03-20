import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key? key,
    required this.imagePath,
    required this.name,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);
  final bool selected;
  final String imagePath;
  final String name;
  final Function() onTap;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: 8.0,
          top: 8.0,
        ),
        decoration: widget.selected
            ? const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/icons/selected_menu_item.png',
                  ),
                ),
              )
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: Image.asset(
                  widget.imagePath,
                ),
              ),
              const SizedBox(width: 19),
              Text(
                widget.name,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
