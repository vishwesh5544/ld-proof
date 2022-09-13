import 'package:flutter/material.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children:  const <Widget>[
              NavBarItem(title: 'Home', bordered: false, borderedInverse: false),
              SizedBox(
                width: 20,
              ),
              NavBarItem(title: 'Login', bordered: false, borderedInverse: false),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
