import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/helper/hive_database_user.dart';
import 'package:projectpraktpm_156_187/model/data_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final HiveDatabase _hive = HiveDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/DrinkTale.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten register
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  // Spacing untuk menempatkan form di tengah halaman
                  SizedBox(height: 200),
                  _uname(),
                  _pass(),
                  _buildRegisterButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _uname() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          hintText: "Username",
          label: Text('Username'),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Colors.deepOrangeAccent),
          ),
        ),
        validator: (String? value) {
          if (value!.trim().isEmpty) {
            return 'Username is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _pass() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          hintText: "Password",
          label: Text('Password'),
          contentPadding: EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Colors.deepOrangeAccent),
          ),
        ),
        obscureText: true,
        validator: (String? value) {
          if (value!.trim().isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        enabled: true,
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 200,
      child: ElevatedButton(
        child: Text(
          labelButton,
          style: TextStyle(fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Colors.black, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Register",
      submitCallback: (value) {
        String username = _usernameController.text.trim();
        String password = _passwordController.text.trim();

        if (username.isNotEmpty && password.isNotEmpty) {
          if (password.length < 8) {
            _showErrorDialog(context, 'Password harus lebih dari 8 karakter');
            return;
          }

          _hive.addData(
            DataModel(
              username: username,
              password: password,
            ),
          );
          _usernameController.clear();
          _passwordController.clear();
          setState(() {});

          Navigator.pop(context);
        }
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
