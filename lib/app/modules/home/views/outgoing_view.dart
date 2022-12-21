import 'package:flutter/material.dart';

class OutgoingView extends StatefulWidget {
  const OutgoingView({Key? key}) : super(key: key);

  @override
  State<OutgoingView> createState() => _OutgoingViewState();
}

class _OutgoingViewState extends State<OutgoingView>
    with AutomaticKeepAliveClientMixin<OutgoingView> {
  final items = List<String>.generate(100, (i) => "Call $i");

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener<ScrollNotification>(
      // onNotification: _handleScrollNotification,
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
