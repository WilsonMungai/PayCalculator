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
      backgroundColor: Colors.grey.shade300,
      body: body(),
    );
  }

  Widget body() {
    return Container(
        child: Column(children: [
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
          )),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // TextFields to input data
            children: [
              inputTextFields(
                  title: "Employee Name", hintText: "Enter employee name"),
              inputTextFields(
                  title: "Number of Hours",
                  hintText: "Enter number of hours worked"),
              inputTextFields(
                  title: "Hourly rate", hintText: "Enter hourly rate"),
              SizedBox(
                height: 30,
              ),
              // Button action
              GestureDetector(
                onTap: () {
                  debugPrint("button tapped");
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                        );
                      });
                },
                // Button style
                child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
              )
            ],
          ),
        ),
      )
    ]));
  }

  // Input text field
  Widget inputTextFields({required String title, required String hintText}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
