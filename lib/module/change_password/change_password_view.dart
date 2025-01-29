import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/module/change_password/change_password_view_model.dart';
import 'package:tes_sekai/util/context_extensions.dart';

class ChangePasswordView extends StatefulWidget {
  static const routeName = "/ChangePasswordView";

  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ChangePasswordViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<ChangePasswordViewModel>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Buat sandi baru untuk menyelesaikan proses masuk ke akun Anda',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  context.sbHeight(size: 80),
                  TextFormField(
                    controller: provider.controllerPassLama,
                    obscureText: provider.isVisiblePassLama,
                    decoration: InputDecoration(
                      labelText: 'Password Lama',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorText: provider.erorrTextPassLama,
                      errorBorder: provider.erorrTextPassLama != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            )
                          : null,
                      suffixIcon: GestureDetector(
                        onTap: () => provider.tapVisiblePassLama(),
                        child: Icon(provider.isVisiblePassLama ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: provider.controllerPassBaru,
                    obscureText: provider.isVisiblePassBaru,
                    decoration: InputDecoration(
                      labelText: 'Password Baru',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () => provider.tapVisiblePassBaru(),
                        child: Icon(provider.isVisiblePassBaru ? Icons.visibility : Icons.visibility_off),
                      ),
                      errorText: provider.erorrTextPassBaru,
                      errorBorder: provider.erorrTextPassBaru != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: provider.controllerKonfirmasi,
                    obscureText: provider.isVisiblePassKonfirmasi,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () => provider.tapVisiblePassKonfirmasi(),
                        child: Icon(provider.isVisiblePassKonfirmasi ? Icons.visibility : Icons.visibility_off),
                      ),
                      errorText: provider.erorrTextPassKonfirmasi,
                      errorBorder: provider.erorrTextPassKonfirmasi != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      provider.submitSimpan(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
