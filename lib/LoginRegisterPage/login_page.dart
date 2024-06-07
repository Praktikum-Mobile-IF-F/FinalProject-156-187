import 'package:flutter/material.dart';
import 'package:projectpraktpm_156_187/helper/hive_database_user.dart';
import 'package:projectpraktpm_156_187/LoginRegisterPage/register_page.dart';
import 'package:projectpraktpm_156_187/view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangani input username dan password
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Key untuk form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validasi dan simpan form
  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null && form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          // Konten login
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Form(
                key: _formKey, // Key untuk form
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Spacing untuk menempatkan form di tengah halaman
                    SizedBox(height: 200),
                    // Input untuk username
                    _uname(),
                    // Input untuk password
                    _pass(),
                    // Tombol login
                    _buildLoginButton(),
                    SizedBox(height: 10),
                    // Teks untuk daftar akun baru
                    Text(
                      'Belum Punya Akun?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Tombol daftar
                    _buildRegisterButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk input username
  Widget _uname() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          hintText: "Username",
          labelText: 'Username',
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
        validator: (value) =>
        value!.isEmpty ? 'Username tidak boleh kosong' : null,
      ),
    );
  }

  // Widget untuk input password
  Widget _pass() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          hintText: "Password",
          labelText: 'Password',
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
        obscureText: true, // Menyembunyikan teks password
        validator: (value) =>
        value!.isEmpty ? 'Password tidak boleh kosong' : null,
      ),
    );
  }

  // Widget untuk tombol umum
  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          labelButton,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Colors.black, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.all(15),
        ),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  // Widget untuk tombol login
  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;
        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  // Proses login
  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;
    String teks = "";
    found = _hive.checkLogin(username, password);

    if (!found) {
      print("Login Failed");
      teks = "Login Gagal";
    } else {
      teks = "Login Sukses";
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    SnackBar snackBar = SnackBar(content: Text(teks));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Widget untuk tombol register
  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Register",
      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        );
      },
    );
  }
}
