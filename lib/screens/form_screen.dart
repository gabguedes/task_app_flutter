import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  int difficultyLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Task',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.deepPurpleAccent,
            ),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: Colors.deepPurple),
            ],
          ),
          height: 650,
          width: 375,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: taskController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Task',
                    fillColor: Colors.white12,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Difficulty:' , style: TextStyle(fontSize: 16),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                        onTap:(){
                          setState(() {
                            difficultyLevel = difficultyLevel == 1 ? 0 : 1;
                          });
                        },
                        child: difficultyLevel >= 1
                            ? const Icon(Icons.star, color: Colors.white, size: 45,)
                            : const Icon(Icons.star_border, color: Colors.white, size: 45,),
                        ),
                        GestureDetector(
                        onTap:(){
                          setState(() {
                            difficultyLevel = difficultyLevel == 2 ? 1 : 2;
                          });
                        },
                        child: difficultyLevel >= 2
                            ? const Icon(Icons.star, color: Colors.white, size: 45,)
                            : const Icon(Icons.star_border, color: Colors.white, size: 45,),
                        ),
                        GestureDetector(
                        onTap:(){
                          setState(() {
                            difficultyLevel = difficultyLevel == 3 ? 2 : 3;
                          });
                        },
                        child: difficultyLevel >= 3
                            ? const Icon(Icons.star, color: Colors.white, size: 45,)
                            : const Icon(Icons.star_border, color: Colors.white, size: 45,),
                        ),
                        GestureDetector(
                        onTap:(){
                          setState(() {
                            difficultyLevel = difficultyLevel == 4 ? 3 : 4;
                          });
                        },
                        child: difficultyLevel >= 4
                            ? const Icon(Icons.star, color: Colors.white, size: 45,)
                            : const Icon(Icons.star_border, color: Colors.white, size: 45,),
                        ),
                        GestureDetector(
                        onTap:(){
                          setState(() {
                            difficultyLevel = difficultyLevel == 5 ? 4 : 5;
                          });
                        },
                        child: difficultyLevel >= 5
                            ? const Icon(Icons.star, color: Colors.white, size: 45,)
                            : const Icon(Icons.star_border, color: Colors.white, size: 45,),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: imageController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Image Link',
                    fillColor: Colors.white12,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(taskController.text);
                },
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
