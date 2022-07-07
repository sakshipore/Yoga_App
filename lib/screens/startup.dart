import 'package:flutter/material.dart';
import 'package:yoga_app/screens/areyouready.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AreYouReady()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "START",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text("Yoga For Beginners"),
              background: Image.network(
                  "https://images.unsplash.com/photo-1545389336-cf090694435e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                  fit: BoxFit.cover),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.thumb_up_alt_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("16 Minutes || 26 Workouts",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          Divider(thickness: 2),
                      itemBuilder: (context, index) => ListTile(
                            leading: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Image.network(
                                  "https://images.squarespace-cdn.com/content/v1/5e13030d166215441db6be9c/1579169341222-DOYWRZ9WQTIL30O4GXHW/Yoga-animation.gif?format=1500w",
                                  fit: BoxFit.cover),
                            ),
                            title: Text("Yoga $index",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            subtitle: Text((index % 2 == 0) ? "00:20" : "x20",
                                style: TextStyle(fontSize: 15)),
                          ),
                      itemCount: 10)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
