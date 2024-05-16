import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  var myController = TextEditingController();
  //list
  List myList = [];
  //save button
  void saveButton() {
    setState(() {
      myList.add(myController.text);
    });
    Navigator.pop(context);
    myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.lightBlue[200],
            title: Text(
              myList[index].toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? true; // Update the state of isChecked
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                actions: [
                  Container(
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: "Enter Text",
                                hintStyle: TextStyle(color: Colors.black38),
                                floatingLabelStyle:
                                    TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: saveButton,
                          child: Text("Save",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
