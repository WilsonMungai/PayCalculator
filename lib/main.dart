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
  TextEditingController rateTextField = new TextEditingController();
  TextEditingController hoursTextField = new TextEditingController();
  TextEditingController employeeNameTextField = new TextEditingController();

  // Variables
  double totalHours = 0.0;
  double hourlyRate = 0.0;
  double earnedPay = 0.0;
  double overtimePay = 0.0;
  double regularPay = 0.0;
  double tax = 0.0;
  bool validate = false;
  String employeeName = "";

  // Calculation Logic
  void payCalculation() {
    double hours;
    double rate;
    double overtime = 0.0;
    double pay;
    double totalPay;
    String name = employeeNameTextField.text + " your pay is:";

    // Get input data
    hours = double.parse(hoursTextField.value.text);
    rate = double.parse(rateTextField.value.text);

    if (hours <= 40) {
      pay = hours * rate;
      totalPay = pay;
    } else {
      pay = (40 * rate);
      overtime = (hours - 40) * rate * 1.5;
      totalPay = pay + overtime;
    }

    // Retrieving input data
    setState(() {
      totalHours = hours;
      hourlyRate = rate;
      overtimePay = overtime;
      regularPay = pay;
      earnedPay = totalPay;
      employeeName = name;
    });
  }

  // Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: body(),
    );
  }

  // Body
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
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Calculator",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
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
                title: "Employee Name",
                hintText: "John Mark",
                controller: employeeNameTextField,
              ),
              inputTextFields(
                title: "Number of Hours",
                hintText: "40",
                controller: hoursTextField,
              ),
              inputTextFields(
                title: "Hourly rate",
                hintText: "20.00",
                controller: rateTextField,
              ),
              SizedBox(
                height: 30,
              ),
              // Button action
              GestureDetector(
                onTap: () {
                  payCalculation();
                  Future.delayed(Duration.zero);
                  debugPrint("button tapped");
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 430,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                empolyee(title: employeeName),
                                // Text("Results"),
                                SizedBox(
                                  height: 10,
                                ),
                                result(title: "Total Pay:", amount: earnedPay),
                                result(
                                    title: "Number of Hours:",
                                    amount: totalHours),
                                result(
                                    title: "Hourly Rate:", amount: hourlyRate),
                                result(
                                    title: "Regular Pay:", amount: regularPay),
                                result(
                                    title: "Overtime Pay:",
                                    amount: overtimePay),
                                result(title: "Tax:", amount: earnedPay * 0.18),
                              ],
                            ),
                          ),
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
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                height: 70,
              ),
              name()
            ],
          ),
        ),
      )
    ]));
  }

  // Input text field
  Widget inputTextFields({
    required String title,
    required TextEditingController controller,
    required String hintText,
  }) {
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
            controller: controller,
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

  // Employee input name
  Widget empolyee({required String title}) {
    return Column(children: [
      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    ]);
    SizedBox(
      height: 10,
    );
  }

  // Calculation Results
  Widget result({required String title, required double amount}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Text(amount.toStringAsFixed(2), style: TextStyle(fontSize: 20)),
        // amount.toStringAsFixed(2),
      ),
    );
  }

  // name and student id
  Widget name() {
    return Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Wilson Mungai Muguthi \n 301287641",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
