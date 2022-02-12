import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              );
            },
          ),
          title: const Text('Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          elevation: 0.0,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.playlist_play_rounded),
            )
          ],
        ),
      body: Padding(padding: EdgeInsets.all(8.0),
      child: Text('Notifications'),)
    );
  }
}
