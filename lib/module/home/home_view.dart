import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_sekai/module/home/home_view_model.dart';
import 'package:tes_sekai/util/app_utils.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/HomeView";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Text(
                      AppUtils.getInitials(provider.user?.namaToko ?? ""),
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    provider.user?.namaToko ?? "",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Informasi Toko'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                provider.toInformasiToko(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                provider.toChangePassword(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                provider.logout(context);
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 50,
          shape: const CircularNotchedRectangle(),
          shadowColor: Colors.black,
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_bag_outlined), onPressed: () {}),
              const SizedBox(width: 40),
              IconButton(icon: const Icon(Icons.phone), onPressed: () {}),
              IconButton(icon: const Icon(Icons.store), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Membuat tombol bulat
          ),
          onPressed: () {
            provider.toBarcodeScanner(context);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.qr_code),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
