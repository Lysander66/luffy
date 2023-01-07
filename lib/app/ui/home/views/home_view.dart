import 'package:flutter/material.dart';

import '../../live/views/live_view.dart';
import 'incoming_view.dart';
import 'outgoing_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabs = [
      IncomingView(),
      OutgoingView(),
      LiveView(),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Incoming'),
                  Tab(text: 'Outgoing'),
                  Tab(text: 'Live'),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: tabs,
        ),
      ),
    );
  }
}
