import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/difficulty.dart';

class Task extends StatefulWidget {
  final String text;
  final String image;
  final int difficulty;

  Task({
    super.key,
    required this.text,
    required this.image,
    required this.difficulty,
  });

  int level = 0;
  int maestry = 0;
  Color progressBarColor = Colors.deepPurple.shade900;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork(){
    if(widget.image.contains('http')){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: widget.progressBarColor,
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
                        ? (widget.level / widget.difficulty) / 10
                        : 1,
                    color: Colors.white,
                    backgroundColor: Colors.black38,
                  ),
                ),
                Text(
                  'Maestry ${widget.maestry}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Level ${widget.level}',
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
                      child: assetOrNetwork() ? Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ) : Image.network(
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
                      onPressed: () {
                        setState(() {
                          double value = widget.difficulty > 0
                              ? (widget.level / widget.difficulty) / 10
                              : 1;
                          if (value == 1 && widget.maestry < 5) {
                            widget.level = 0;
                            widget.maestry++;
                            switch (widget.maestry) {
                              case 1:
                                widget.progressBarColor = Colors.green;
                                break;

                              case 2:
                                widget.progressBarColor = Colors.amber.shade700;
                                break;

                              case 3:
                                widget.progressBarColor = Colors.deepOrange;
                                break;

                              case 4:
                                widget.progressBarColor = Colors.pinkAccent;
                                break;

                              case 5:
                                widget.progressBarColor = Colors.black;
                                break;
                            }
                          }
                          widget.level++;
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
                            'UP',
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
