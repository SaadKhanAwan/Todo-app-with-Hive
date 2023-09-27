import 'package:flutter/material.dart';
import 'package:flutter__hive/model/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter__hive/boxes/boxesclass.dart';
import 'package:hive_flutter/adapters.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // this is title Textfield
  final titlecon = TextEditingController();
  // this is Disscreption Textfield
  final discon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hive databse"),
      ),
      body: ValueListenableBuilder<Box<notesmodel>>(
        valueListenable: boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<notesmodel>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // this is to fetch title data
                            Text(
                              data[index].title.toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            // this is for space
                            Spacer(),
                            // this is to delete data on screen
                            InkWell(
                              onTap: () {
                                deleteit(data[index]);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // this is to modify data on Screen
                            InkWell(
                                onTap: () {
                                  // operations.Editit();
                                  _editmydiloge(data[index], data[index].title,
                                      data[index].describtion);
                                },
                                child: Icon(Icons.edit)),
                          ],
                        ),
                        Text(data[index].describtion.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showmydiloge();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // delete it
  void deleteit(notesmodel notesModel) async {
    await notesModel.delete();
  }

  // this is for show dilogue box and add operations
  Future<void> _showmydiloge() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add notes"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titlecon,
                    decoration: InputDecoration(
                        hintText: "enter title", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: discon,
                    decoration: InputDecoration(
                        hintText: "enter discribtion",
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel")),
              TextButton(
                  onPressed: () {
                    final data = notesmodel(
                        title: titlecon.text.toString(),
                        describtion: discon.text.toString());
                    final box = boxes.getData();
                    box.add(data);
                    data.save();
                    titlecon.clear();
                    discon.clear();
                    Navigator.pop(context);
                  },
                  child: Text("add"))
            ],
          );
        });
  }

  // this is for edit

  Future<void> _editmydiloge(
      notesmodel notesModel, String title, String decribtion) async {
    titlecon.text = title;
    discon.text = decribtion;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit notes"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: titlecon,
                    decoration: InputDecoration(
                        hintText: "enter title", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: discon,
                    decoration: InputDecoration(
                        hintText: "enter discribtion",
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel")),
              TextButton(
                  onPressed: () {
                    notesModel.title = titlecon.text.toString();
                    notesModel.describtion = discon.text.toString();
                    notesModel.save();
                    titlecon.clear();
                    discon.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Edit"))
            ],
          );
        });
  }
}
