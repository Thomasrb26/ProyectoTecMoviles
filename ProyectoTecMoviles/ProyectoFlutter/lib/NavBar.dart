import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'accountName',
              style: TextStyle(color: Colors.black.withOpacity(1.0)),
            ),
            accountEmail: Text('accountEmail',
                style: TextStyle(color: Colors.black.withOpacity(1.0))),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/profile1.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'http://wfrec.org/wp-content/uploads/2018/02/solid-color-blue-wallpaper-31.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text('admin'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('configuraciones'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
