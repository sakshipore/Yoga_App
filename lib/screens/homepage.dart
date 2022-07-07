import 'package:flutter/material.dart';
import 'package:yoga_app/screens/startup.dart';
import 'package:yoga_app/widgets/cusromdrawer.dart';
import 'package:yoga_app/widgets/customappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorsTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorsTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrollLister(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollLister,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 120, 50, 30),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text("1",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          )),
                                      Text("Streak",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("120",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          )),
                                      Text("kCal",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("12",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          )),
                                      Text("Minutes",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text("Yoga For All",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => StartUp()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Yoga For Beginners",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 38,
                                            child: Text(
                                              "Last Time: 2 Feb",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "10 Minutes Yoga",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 38,
                                          child: Text(
                                            "Last Time: 2 Feb",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: Text("Yoga For Students",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Yoga To Increase Concentration",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 38,
                                          child: Text(
                                            "Last Time: 2 Feb",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Yoga For Shoulders and Eyes",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 38,
                                          child: Text(
                                            "Last Time: 2 Feb",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomAppBar(
                    animationController: _animationController,
                    colorsTween: _colorsTween,
                    drawerTween: _drawerTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    yogaTween: _yogaTween,
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
