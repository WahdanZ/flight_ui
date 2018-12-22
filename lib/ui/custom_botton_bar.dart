import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  final bottomNavigationBarItemStyle =
      TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

  CustomBottomNavigationBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.deepOrange,
        ),
        title: Text("Explore",
            style: bottomNavigationBarItemStyle.copyWith(
                color: Colors.deepOrange)),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Watchlist",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
