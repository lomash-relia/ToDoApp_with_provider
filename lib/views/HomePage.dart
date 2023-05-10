import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_app/models/ToDoModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Daily Goals',
          ),
          backgroundColor: Colors.indigo,
          elevation: 0,
        ),
        backgroundColor: Colors.indigo,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<ToDoModel>(context, listen: false).addTaskInList();
          },
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.add_circle_outline_rounded,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 160, child: AnalogClock.dark()),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(60)),
                  color: Colors.white),
              child: Consumer<ToDoModel>(
                builder: ((context, todo, child) => ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 8, left: 16, right: 16),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                              left: 32, right: 32, top: 8, bottom: 8),
                          title: Text(
                            todo.taskList[index].title,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(todo.taskList[index].detail,
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold)),
                        ),
                      );
                    })),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
