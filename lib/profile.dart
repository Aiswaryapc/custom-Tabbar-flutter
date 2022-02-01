import 'package:flutter/material.dart';

import 'custom_header.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              key: UniqueKey(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Row(
                        children: [
                          Image.asset('images/applogo.png'),
                          Expanded(child: Container()),
                          FittedBox(child: Text("Cancel", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 50),
                        child: FittedBox(child: Text("My Profile", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),)),
                      )
                    ],
                  ),
                ),


              ),
            ),

            //tabbar
            SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: MyCustomHeader(
                    expandedHeight: kToolbarHeight,
                    tabs: TabBar(overlayColor: null,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 10,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Creates border
                          color: Colors.black),
                      controller: tabController,
                      tabs: [
                        tabText("Personal Information"),
                        tabText("Measurement"),
                      ],
                    ),)),
            //children
            SliverFillRemaining(
              child: TabBarView(
                controller: tabController,
                children: [
                  Center(child: Text("I'm 1")),
                  Center(child: Text("I'm 2"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabText(txt){
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Text(txt, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
      ),
    );
  }
}


