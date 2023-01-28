import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),

      // remove debug banner
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
        child: Column(
      children: [
        Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Work Pay",
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Calculator", style: TextStyle(fontSize: 50))
                    ]),
              ),
            ))
      ],
    ));
  }
}
