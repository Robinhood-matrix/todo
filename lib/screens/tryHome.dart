import "package:flutter/material.dart";
import 'home.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 150)),
              Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue,
                  ),
                  child: const Icon(Icons.check_rounded)),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  "My Todo",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  "My Todo helps you stay organized and",
                  style: TextStyle(
                    wordSpacing: 3,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, left: 20),
                child: const Text(
                  "performs your tasks much faster",
                  style: TextStyle(
                    wordSpacing: 3,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.blue))),
                  ),
                  child: Text(
                    "Try Demo",
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ToDo()),
                    );
                  },
                ),
              ),
              TextButton(
                child: Text(
                  "No Thanks",
                  style: TextStyle(color: Colors.blue[700]),
                ),
                onPressed: () {
                  const ToDo();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
