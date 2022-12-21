import 'package:flutter/material.dart';

class IncomingView extends StatefulWidget {
  const IncomingView({Key? key}) : super(key: key);

  @override
  State<IncomingView> createState() => _IncomingViewState();
}

class _IncomingViewState extends State<IncomingView>
    with AutomaticKeepAliveClientMixin<IncomingView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call_received, size: 350),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
