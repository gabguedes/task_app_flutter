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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Task',
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'You must insert a task.';
                        }
                        return null;
                      },
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
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Difficulty:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  difficultyLevel =
                                      difficultyLevel == 1 ? 0 : 1;
                                });
                              },
                              child: difficultyLevel >= 1
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  difficultyLevel =
                                      difficultyLevel == 2 ? 1 : 2;
                                });
                              },
                              child: difficultyLevel >= 2
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  difficultyLevel =
                                      difficultyLevel == 3 ? 2 : 3;
                                });
                              },
                              child: difficultyLevel >= 3
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  difficultyLevel =
                                      difficultyLevel == 4 ? 3 : 4;
                                });
                              },
                              child: difficultyLevel >= 4
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  difficultyLevel =
                                      difficultyLevel == 5 ? 4 : 5;
                                });
                              },
                              child: difficultyLevel >= 5
                                  ? const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 45,
                                    )
                                  : const Icon(
                                      Icons.star_border,
                                      color: Colors.white,
                                      size: 45,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You must insert a image url.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image Link',
                        fillColor: Colors.white12,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade900,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.deepPurple.shade900,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(taskController.text);
                          print(difficultyLevel);
                          print(imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Printing screen...',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Add Task',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
