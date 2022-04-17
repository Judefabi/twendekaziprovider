import 'package:flutter/material.dart';
import 'package:twendekaziprovider/widgets/profile_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: const Text('Profile',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
        //Profile header
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(),
            // _buildListTiles(
            //   'Orders',
            //   'Orders posted',
            // ),
            const SizedBox(height: 10),
            _buildListTiles('Address', 'Eldoret, Uasin Gishu'),
            const SizedBox(height: 10),
            _buildListTiles(
              'Wallet',
              'Bal. Kshs 200',
            ),
            const SizedBox(height: 10),
            _buildListTiles('Settings', 'Edit account'),
            const SizedBox(height: 10),
          ],
        ),

        //options section
    ));
  }

  Widget _buildListTiles(
    String title,
    String subtitle,
  ) {
    return Card(
      child: ListTile(
        leading: const SizedBox(
          width: 1.0,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}
