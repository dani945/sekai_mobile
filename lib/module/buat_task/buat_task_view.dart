import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_pilarmedia_indonesia/util/context_extensions.dart';
import 'package:tes_pilarmedia_indonesia/util/i_text_field.dart';

import '../../util/i_button.dart';
import 'buat_task_view_model.dart';

class BuatTaskView extends StatefulWidget {
  static const routeName = "/BuatTaskView";

  const BuatTaskView({Key? key}) : super(key: key);

  @override
  State<BuatTaskView> createState() => _HomeViewState();
}

class _HomeViewState extends State<BuatTaskView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BuatTaskViewModel(context),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Consumer<BuatTaskViewModel>(builder: (context, provider, child) {
      // var selectedIndex = provider.selectedIndex;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Management'),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ITextField.primary(
                label: "Judul Tugas*",
                controller: provider.controllerJudulTugas,
              ),
              context.sbHeight(),
              ITextField.primary(
                label: "Deskripsi*",
                controller: provider.controllerDeskripsi,
                maxLine: 5,
              ),
              context.sbHeight(),
              ITextField.dateTime(
                label: "Tanggal Jatuh Tempo*",
                controller: provider.controllerTanggalJatuhTempo,
                onSubmitted: (DateTime? dateTime) {
                  provider.selectDate(context, dateTime);
                },
                context: context,
              ),
              context.sbHeight(),
              const Text("Kategory*"),
              context.sbHeight(size: 8),
              ListTile(
                title: const Text("Work"),
                leading: Radio<String>(
                  value: "1",
                  groupValue: provider.selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      provider.selectCategory(value: value);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Personal"),
                leading: Radio<String>(
                  value: "2",
                  groupValue: provider.selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      provider.selectCategory(value: value);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Urgent"),
                leading: Radio<String>(
                  value: "3",
                  groupValue: provider.selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      provider.selectCategory(value: value);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 50,
            child: IButton.primary(
              onPressed: () {
                if (provider.resArg != null) {
                  provider.updateData(context, id: provider.id);
                } else {
                  provider.saveData(context);
                }
              },
              title: provider.resArg != null ? "Update" : "Simpan",
            ),
          ),
        ),
      );
    });
  }
}
