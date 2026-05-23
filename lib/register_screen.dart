import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
import 'home_screen.dart'; // ✅ Lepas daftar terus ke HOME
import 'background_screen.dart'; // ✅ Background sama

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  String? _periodStatus; // Simpan "Yes" atau "No"
  bool _loading = false;
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<void> _daftarAkaun() async {
    // 🛑 SEMAK BORANG
    if (_nameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passController.text.isEmpty ||
        _periodStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sila lengkapkan SEMUA borang!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (_passController.text != _confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata laluan tidak sama!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _loading = true);
    try {
      // 1. Daftar akaun
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );

      // 2. Simpan data ke database
      await _db.collection("users").doc(userCred.user?.uid).set({
        "fullname": _nameController.text.trim(),
        "age": int.parse(_ageController.text.trim()),
        "email": _emailController.text.trim(),
        "has_period": _periodStatus,
        "created_at": FieldValue.serverTimestamp(),
      });

      // 3. ✅ BERJAYA -> MASUK KE HOME SCREEN
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Pendaftaran Berjaya! 🎉"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Ralat"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Ralat berlaku"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      // ✅ GUNA BACKGROUND SAMA
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                // 🌸 TAJUK
                const Text(
                  "BLOOMING PETAL",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                const Text(
                  "Track Your Flow Here",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 30),

                // ✏️ NAMA PENUH
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    filled: true,
                    fillColor: Colors.white54,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // 🎂 UMUR
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    hintText: "Age",
                    filled: true,
                    fillColor: Colors.white54,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),

                // 📧 EMAIL
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                    filled: true,
                    fillColor: Colors.white54,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                // 🔒 KATA LALUAN
                TextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    hintText: "New Password",
                    filled: true,
                    fillColor: Colors.white54,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                // 🔒 SAHKAN KATA LALUAN
                TextField(
                  controller: _confirmPassController,
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.white54,
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // ❓ SOALAN: Dah dapat haid ke belum?
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Have you get your period?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Radio(
                      value: "Yes",
                      groupValue: _periodStatus,
                      activeColor: Colors.pink,
                      onChanged: (val) =>
                          setState(() => _periodStatus = val.toString()),
                    ),
                    const Text("Yes"),
                    const SizedBox(width: 20),
                    Radio(
                      value: "No",
                      groupValue: _periodStatus,
                      activeColor: Colors.pink,
                      onChanged: (val) =>
                          setState(() => _periodStatus = val.toString()),
                    ),
                    const Text("No"),
                  ],
                ),
                const SizedBox(height: 20),

                // 🌸 HIASAN BUNGA
                const Icon(Icons.local_florist, size: 60, color: Colors.pink),
                const SizedBox(height: 20),

                // 🔘 BUTANG SIGN UP
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _daftarAkaun,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 3,
                    ),
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.pink)
                        : const Text("Sign Up", style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔗 KE LOGIN
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already Have An Account? ",
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
