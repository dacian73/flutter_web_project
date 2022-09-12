import 'package:derzelas/logic/menu_controler.dart';
import 'package:flutter/material.dart';
import 'package:derzelas/homePage/const/colors.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class MainMenu extends StatelessWidget {
  final MenuController _menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
            _menuController.menuItems.length,
            (index) => MenuItem(
                text: _menuController.menuItems[index],
                isActive: index == _menuController.selectedIndex,
                press: () {
                  _menuController.setMenuIndex(index);
                })),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    Key key,
    this.isActive,
    this.text,
    this.press,
  }) : super(key: key);

  @required
  final bool isActive;
  @required
  final String text;
  @required
  final VoidCallback press;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return mov;
    } else if (!widget.isActive && _isHover) {
      return mov.withOpacity(0.5);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: animateDuration,
        margin: EdgeInsets.symmetric(horizontal: smallPadding),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: _borderColor(), width: 4))),
        padding: EdgeInsets.symmetric(vertical: smallPadding / 2),
        child: Text(
          widget.text,
          style: TextStyle(
              color: negru,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}
