import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class save extends StatefulWidget {
  @override
  _saveState createState() => _saveState();
}

class _saveState extends State<save> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    // Initially, add one text field
    controllers.add(TextEditingController());
  }

  void addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void deleteTextField(int index) {
    setState(() {
      controllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic TextFields'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: controllers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                              hintText: 'Enter something',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTextField(index),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: addTextField,
                child: Text('Add Text Field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}