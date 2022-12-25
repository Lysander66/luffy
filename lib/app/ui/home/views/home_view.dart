import 'package:flutter/material.dart';

import 'incoming_view.dart';
import 'outgoing_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Incoming'),
                  Tab(text: 'Outgoing'),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncomingView(),
            OutgoingView(),
          ],
        ),
      ),
    );
  }
}
