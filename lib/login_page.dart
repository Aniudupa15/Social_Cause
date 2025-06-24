import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 245, 157, 1),
                  Color.fromRGBO(255, 225, 100, 1),
                  Color.fromRGBO(255, 249, 196, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),

          // Main content
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/logo_LoginPage.png', height: 100),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      shadows: [
                        Shadow(color: Colors.black54, offset: Offset(1, 2), blurRadius: 3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Box
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.22),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.09),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: emailController,
                                  style: const TextStyle(color: Colors.white, fontFamily: 'Fredoka'),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email, color: Colors.white70),
                                    border: InputBorder.none,
                                    hintText: "Email Id",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[50],
                                        fontSize: 19,
                                        fontFamily: 'Fredoka'),
                                  ),
                                ),
                              ),
                              Container(height: 1, color: Colors.white.withOpacity(0.3)),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.white, fontFamily: 'Fredoka'),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[50],
                                        fontSize: 19,
                                        fontFamily: 'Fredoka'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChangePassword()),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'Fredoka',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: [Colors.orange.shade700, Colors.deepOrange.shade400],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();
                              final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');

                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please enter both Email and Password.",
                                      style: TextStyle(fontFamily: 'Fredoka'),
                                    ),
                                  ),
                                );
                              } else if (!emailRegex.hasMatch(email)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Please enter a valid email address.",
                                      style: TextStyle(fontFamily: 'Fredoka'),
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NewScreen()),
                                );
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Fredoka',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Screen displayed after successful login
class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Page",
          style: TextStyle(fontFamily: 'Fredoka'),
        ),
      ),
      body: const Center(
        child: Text(
          "You have successfully logged in!",
          style: TextStyle(fontFamily: 'Fredoka'),
        ),
      ),
    );
  }
}

//Change Password page
class ChangePassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 245, 157, 1),
                  Color.fromRGBO(255, 225, 100, 1),
                  Color.fromRGBO(255, 249, 196, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter your Email ID:",
                      style: TextStyle(
                        fontFamily: 'Fredoka',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _customTextField(emailController, "Email Id"),
                    const SizedBox(height: 40),
                    const Text(
                      "New Password:",
                      style: TextStyle(
                        fontFamily: 'Fredoka',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _customTextField(newPasswordController, "Password", obscure: true),
                    const SizedBox(height: 40),
                    const Text(
                      "Confirm Password:",
                      style: TextStyle(
                        fontFamily: 'Fredoka',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _customTextField(confirmPasswordController, "Password", obscure: true),
                    const SizedBox(height: 40),
                    MaterialButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final newPassword = newPasswordController.text.trim();
                        final confirmPassword = confirmPasswordController.text.trim();
                        final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');

                        if (email.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please fill in all the fields.",
                                style: TextStyle(fontFamily: 'Fredoka'),
                              ),
                            ),
                          );
                        } else if (!emailRegex.hasMatch(email)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please enter a valid email address.",
                                style: TextStyle(fontFamily: 'Fredoka'),
                              ),
                            ),
                          );
                        } else if (newPassword != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Passwords do not match. Please try again.",
                                style: TextStyle(fontFamily: 'Fredoka'),
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        }
                      },
                      color: Colors.orange.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Fredoka',
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Used to create email, new password, and confirm password fields with same style
  Widget _customTextField(TextEditingController controller, String hintText, {bool obscure = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(color: Colors.white, fontFamily: 'Fredoka'),
        decoration: InputDecoration(
          prefixIcon: obscure
              ? const Icon(Icons.lock_outline, color: Colors.white70)
              : const Icon(Icons.email_outlined, color: Colors.white70),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[50], fontSize: 17, fontFamily: 'Fredoka'),
        ),
      ),
    );
  }
}
