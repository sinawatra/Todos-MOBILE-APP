import 'package:app11/data/database.dart';
import 'package:app11/util/dialog_box.dart';
import 'package:app11/util/toto_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db =ToDoDataBase();

  @override
  void initState() {
    //if this is the 1st time ever open the app, then create the default data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }


  //text controller
  final _controller = TextEditingController();


  //check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask() {
setState(() {
  db.toDoList.add([_controller.text, false]);
  _controller.clear();
});
Navigator.of(context).pop();
db.updateDataBase();
  }

  //create new task 
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller:  _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  //delete task
  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Todos"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,

      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (p0) {
                deleteTask(index);
              },
            );
          }),
    );
  }
}
