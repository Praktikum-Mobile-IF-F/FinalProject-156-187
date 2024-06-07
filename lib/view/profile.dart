import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/helper/shared_preference.dart';
import 'package:projectpraktpm_156_187/LoginRegisterPage/login_page.dart';
import 'package:projectpraktpm_156_187/random_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Center(child: Text("Drink Recipe")),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(30, 60, 30, 30),
          child: Column(
            children: [
              _profilePhoto(),
              SizedBox(height: 20),
              _name(),
              SizedBox(height: 20),
              _randomPick(),
              SizedBox(height: 70),
              _logout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePhoto() {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        foregroundColor: Colors.blue,
        backgroundImage: AssetImage('assets/profile.png'),
        radius: 50,
      ),
    );
  }


  Widget _name() {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: SharedPreference().getUsername(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Text(
            "${snapshot.data}",
            style: TextStyle(fontSize: 24),
          );
        },
      ),
    );
  }

  Widget _randomPick() {
    return Container(
      height: 200,
      width: 400,
      child: Card(
        color: Colors.deepOrange[200],
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RandomPage(),
              ),
            );
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pick Your Random Drinks for Today!',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                ),
                SizedBox(height: 10),
                Icon(Icons.card_giftcard, size: 100, color: Colors.deepPurple[300]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logout() {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          SharedPreference().setLogout();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login_outlined, color: Colors.black54),
            SizedBox(width: 20),
            Text('Logout', style: TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          padding: EdgeInsets.all(15),
        ),
      ),
    );
  }
}

