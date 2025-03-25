import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Mahmoud Mohamed",
              style: AppTextStyles.semibold18.copyWith(color: Colors.white),
            ),
            accountEmail: Text("mahmoud@example.com", style: AppTextStyles.regular14.copyWith(color: Colors.white),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.red),
            title: Text("Favorites"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.green),
            title: Text("My Cart"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.orange),
            title: Text("Profile"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dark_mode, color: Colors.grey),
            title: Text("Dark Mode"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
