import 'package:flight_ui/ui/custom_botton_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home_screen_toolbar.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeScreenToolbar(),
            HomeScreenBottomPart(),
            HomeScreenBottomPart(),
            HomeScreenBottomPart()
          ],
        ),
      ),
    );
  }
}

class HomeScreenBottomPart extends StatefulWidget {
  HomeScreenBottomPart();

  factory HomeScreenBottomPart.forDesignTime() {
    return new HomeScreenBottomPart();
  }

  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Currently Watchs Items"),
                  Spacer(),
                  Text(
                    "View All 12",
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return CityCard();
              },
            ))
      ],
    );
  }
}

class CityCard extends StatelessWidget {
  CityCard();

  factory CityCard.forDesignTime() {
    return new CityCard();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.orange,
              height: 210,
              width: 160,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              height: 60,
              width: 160,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.black.withOpacity(.1)],
                )),
              ),
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "city",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
