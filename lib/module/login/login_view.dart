import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/util/context_extensions.dart';
import 'package:tes_sekai/util/i_outline_button.dart';

import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  static const routeName = "/LoginView";

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        backgroundColor: const Color(0xFF1E88E5),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E88E5), Color(0xFF1976D2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: provider.controllerEmail,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      errorText: provider.errorEmail,
                      errorBorder: provider.errorEmail != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: provider.controllerPassword,
                    cursorColor: Colors.black,
                    obscureText: provider.isVisiblePass,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () => provider.tapVisiblePass(),
                        child: Icon(provider.isVisiblePass ? Icons.visibility : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa password? Klik Disini',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      provider.submitLogin(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(24),
          color: const Color(0xFF1976D2),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'Belum memiliki Akun?',
              style: TextStyle(color: Colors.white),
            ),
            context.sbHeight(),
            IOutlineButton.primary(
              onPressed: () {
                provider.toRegisterForm(context);
              },
              title: 'Buat Akun',
            ),
          ]),
        ),
      );
    });
  }
}
