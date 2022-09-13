import 'package:flutter/material.dart';

import 'navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const NavBarLogo(),
            const SizedBox(width: 820),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const NavBarItem(title: 'Home', bordered: false, borderedInverse: false),
                const SizedBox(
                  width: 20,
                ),
                const NavBarItem(title: 'Login', bordered: false, borderedInverse: false),
                const SizedBox(
                  width: 20,
                ),
                const NavBarItem(title: 'Features', bordered: false, borderedInverse: false),
                const SizedBox(
                  width: 20,
                ),
                const NavBarItem(title: 'Pricing', bordered: false, borderedInverse: false),
                const SizedBox(
                  width: 20,
                ),
                Ink(child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const NavBarItem(title: 'Login', bordered: true, borderedInverse: false))),
                const SizedBox(
                  width: 20,
                ),
                Ink(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: const NavBarItem(title: 'Signup', bordered: true, borderedInverse: true)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
