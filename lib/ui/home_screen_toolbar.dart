import 'package:flutter/material.dart';

import 'choice_chip.dart';

class HomeScreenToolbar extends StatefulWidget {
  HomeScreenToolbar();

  factory HomeScreenToolbar.forDesignTime() {
    return new HomeScreenToolbar();
  }

  @override
  HomeScreenToolbarState createState() => new HomeScreenToolbarState();
}

class HomeScreenToolbarState extends State<HomeScreenToolbar> {
  var locations = ["Cairo", "Tanta"];
  int selectedLocationIndex = 0;
  bool isFlighSelected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomWaveClipper(),
          child: Container(
              height: 389,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.orange])),
              child: barContent()),
        )
      ],
    ));
  }

  Widget barContent() {
    return Column(children: <Widget>[
      SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            PopupMenuButton(
                onSelected: (index) {
                  setState(() {
                    selectedLocationIndex = index;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      locations[selectedLocationIndex],
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    )
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      PopupMenuItem(
                        value: 0,
                        child: Text(locations[0]),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Text(locations[1]),
                      )
                    ]),
            Spacer(),
            Icon(
              Icons.settings,
              color: Colors.white,
            )
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        "Where would\nyou want to go?",
        style: TextStyle(fontSize: 24, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  border: InputBorder.none)),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isFlighSelected = true;
              });
            },
            child: CustomChoiceChip(Icons.flight, "Flight", isFlighSelected),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                isFlighSelected = false;
              });
            },
            child: CustomChoiceChip(
                Icons.flight_takeoff, "Hotels", !isFlighSelected),
          ),
        ],
      )
    ]);
  }
}

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height * .96);
    var firstControlPoint = new Offset(size.width * .25, size.height * .85);
    var firstEndPoint = Offset(size.width * .5, size.height * .90);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width * .75, size.height * .95);
    var secondEndPoint = Offset(size.width, size.height * .80);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
