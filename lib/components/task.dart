import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/difficulty.dart';

class Task extends StatefulWidget {
  final String text;
  final String image;
  final int difficulty;

  const Task({
    super.key,
    required this.text,
    required this.image,
    required this.difficulty,
  });

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  int maestry = 0;
  Color progressBarColor = Colors.deepPurple.shade900;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: progressBarColor,
            ),
            height: 140,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: widget.difficulty > 0
                        ? (level / widget.difficulty) / 10
                        : 1,
                    color: Colors.white,
                    backgroundColor: Colors.black38,
                  ),
                ),
                Text(
                  'Level $level',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(4)),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Difficulty(
                        difficultyLevel: widget.difficulty,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 52,
                    width: 72,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade600,
                      ),

                      onPressed: () {
                        setState(() {
                          double value = widget.difficulty > 0
                              ? (level / widget.difficulty) / 10
                              : 1;
                          if (value == 1 && maestry <= 5) {
                            level = 0;
                            maestry++;
                            switch (maestry) {
                              case 1:
                                progressBarColor = Colors.green;
                                break;

                              case 2:
                                progressBarColor = Colors.amber;
                                break;

                              case 3:
                                progressBarColor = Colors.deepOrange;
                                break;

                              case 4:
                                progressBarColor = Colors.pinkAccent;
                                break;

                              case 5:
                                progressBarColor = Colors.black;
                                break;
                            }
                          }
                          level++;
                        });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_drop_up,
                            color: Colors.white,
                          ),
                          Text(
                            'up',
                            style: TextStyle(fontSize: 15,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
