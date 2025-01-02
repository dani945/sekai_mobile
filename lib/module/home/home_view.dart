import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_pilarmedia_indonesia/theme/i_colors.dart';
import 'package:tes_pilarmedia_indonesia/util/context_extensions.dart';
import 'package:tes_pilarmedia_indonesia/util/i_text_field.dart';

import 'home_view_model.dart';

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

      return DefaultTabController(
        length: 3, // Jumlah tab
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: provider.colorTheme,
            title: const Text('Aplikasi Management'),
            bottom: const TabBar(
              indicatorColor: Palette.orange,
              labelColor: Palette.orange,
              tabs: [
                Tab(text: 'Work'),
                Tab(text: 'Personal'),
                Tab(text: 'Urgent'),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    provider.setTheme(context, val: value);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Icon(Icons.settings),
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: "light",
                        child: Text("Light", style: context.headline3),
                      ),
                      PopupMenuItem<String>(
                        value: "dark",
                        child: Text("Dark", style: context.headline3),
                      ),
                    ];
                  },
                ),
              )
            ],
          ),
          body: TabBarView(
            children: [
              _buildLitWork(context),
              _buildLitPersonal(context),
              _buildLitUrgent(context),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.toBuatTask(context);
            }, // Ikon di dalam tombol
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add), // Warna latar belakang tombol
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      );
    });
  }

  Widget _buildLitWork(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ITextField.primary(
                label: "",
                hintText: "Searcing...",
                controller: provider.controllerSearchWork,
                onChanged: (value) {
                  provider.search(value, category: "1");
                },
              ),
            ),
            context.sbHeight(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final data = provider.dataWork[index];
                  return Card(
                    color: Palette.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.judulTugas,
                                  style: context.headline3,
                                ),
                                context.sbHeight(),
                                Text(data.deskripsi),
                                context.sbHeight(),
                                Text(data.tanggalJatuhTempo),
                                context.sbHeight(),
                                if (data.status.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: data.status == "pending" ? Palette.orange : Palette.secondary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Status : ${data.status}"),
                                  ),
                              ],
                            ),
                          ),
                          context.sbWidth(),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              provider.actionButton(
                                context,
                                val: value,
                                index: index,
                                option: "1",
                                id: data.id,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Icon(Icons.more_horiz_rounded),
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: "edit",
                                  child: Text("Edit", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_pending",
                                  child: Text("Set Pending", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_complete",
                                  child: Text("Set Complete", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "delete",
                                  child: Text("Delete", style: context.headline3),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => context.sbHeight(size: 8),
                itemCount: provider.dataWork.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLitPersonal(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ITextField.primary(
                label: "",
                hintText: "Searcing...",
                controller: provider.controllerSearchPersonal,
                onChanged: (value) {
                  provider.search(value, category: "2");
                },
              ),
            ),
            context.sbHeight(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final data = provider.dataPersonal[index];
                  return Card(
                    color: Palette.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.judulTugas,
                                  style: context.headline3,
                                ),
                                context.sbHeight(),
                                Text(data.deskripsi),
                                context.sbHeight(),
                                Text(data.tanggalJatuhTempo),
                                context.sbHeight(),
                                if (data.status.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: data.status == "pending" ? Palette.orange : Palette.secondary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Status : ${data.status}"),
                                  ),
                              ],
                            ),
                          ),
                          context.sbWidth(),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              provider.actionButton(
                                context,
                                val: value,
                                index: index,
                                option: "2",
                                id: data.id,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Icon(Icons.more_horiz_rounded),
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: "edit",
                                  child: Text("Edit", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_pending",
                                  child: Text("Set Pending", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_complete",
                                  child: Text("Set Complete", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "delete",
                                  child: Text("Delete", style: context.headline3),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => context.sbHeight(size: 8),
                itemCount: provider.dataPersonal.length,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLitUrgent(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ITextField.primary(
                label: "",
                hintText: "Searcing...",
                controller: provider.controllerSearchUrgent,
                onChanged: (value) {
                  provider.search(value, category: "3");
                },
              ),
            ),
            context.sbHeight(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final data = provider.dataUrgent[index];
                  return Card(
                    color: Palette.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.judulTugas,
                                  style: context.headline3,
                                ),
                                context.sbHeight(),
                                Text(data.deskripsi),
                                context.sbHeight(),
                                Text(data.tanggalJatuhTempo),
                                context.sbHeight(),
                                if (data.status.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: data.status == "pending" ? Palette.orange : Palette.secondary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("Status : ${data.status}"),
                                  ),
                              ],
                            ),
                          ),
                          context.sbWidth(),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              provider.actionButton(
                                context,
                                val: value,
                                index: index,
                                option: "3",
                                id: data.id,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Icon(Icons.more_horiz_rounded),
                            ),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: "edit",
                                  child: Text("Edit", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_pending",
                                  child: Text("Set Pending", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "set_complete",
                                  child: Text("Set Complete", style: context.headline3),
                                ),
                                PopupMenuItem<String>(
                                  value: "delete",
                                  child: Text("Delete", style: context.headline3),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => context.sbHeight(size: 8),
                itemCount: provider.dataUrgent.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
