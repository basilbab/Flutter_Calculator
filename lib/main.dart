import 'dart:ffi';

import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = "";
  String num1 = "";
  String num2 = "";
  String operation = "";
  double a = 0.0;
  double b = 0.0;
  // void add() {
  //   num1="";
  //   num2="";
  //   num1Controller.clear();
  //   print(
  //       'The sum is ${double.parse(num1Controller.text) + double.parse(num2Controller.text)}');
  //   setState(() {
  //     result =
  //         "${(double.parse(num1Controller.text) + double.parse(num2Controller.text))}";
  //   });
  // }

  // void subtract() {
  //   print(
  //       'The difference is ${double.parse(num1Controller.text) - double.parse(num2Controller.text)}');
  //   setState(() {
  //     result =
  //         "${(double.parse(num1Controller.text) - double.parse(num2Controller.text))}";
  //   });
  // }

  // void multiply() {
  //   print(
  //       'The product is ${double.parse(num1Controller.text) * double.parse(num2Controller.text)}');
  //   setState(() {
  //     result =
  //         "${(double.parse(num1Controller.text) * double.parse(num2Controller.text))}";
  //   });
  // }

  // void division() {
  //   double q = double.parse(num2Controller.text);
  //   result = "";
  //   if (q != 0) {
  //     print(
  //         'The Division is ${double.parse(num1Controller.text) / double.parse(num2Controller.text)}');
  //     setState(() {
  //       result =
  //           "${(double.parse(num1Controller.text) / double.parse(num2Controller.text))}";
  //     });
  //   } else {
  //     setState(() {
  //       result = "Infinity!";
  //     });
  //     print('Infinity!');
  //   }
  // }
  void calculate(String op) {
    if ((op == '+') || (op == '-') || (op == '*') || (op == '/')) {
      a = double.parse(num1Controller.text);
      setState(() {
        num1Controller.text = "";
      });
      operation = op;
      num1 = "";
      num2 = "";
      print(a);
    }
    if (op == "=") {
      if (operation == "+") {
        setState(() {
          num1Controller.text = "${a + double.parse(num1Controller.text)}";
        });
      
      }
      else if(operation=="-")
      {
         setState(() {
          num1Controller.text = "${a - double.parse(num1Controller.text)}";
        });
      }
      else if(operation =="*")
      {
         setState(() {
          num1Controller.text = "${a * double.parse(num1Controller.text)}";
        });
      }
      else 
      {
         setState(() {
          num1Controller.text = "${a / double.parse(num1Controller.text)}";
        });
      }
    }
  }

  void reset() {
    num1Controller.clear();
    num2Controller.clear();
    setState(() {
      result = "";
      num1 = "";
    });
  }

  void setNumber1(String s) {
    num1 = num1 + s;
    num2 = num2 + s;
    print(num1);

    setState(() {
      num1Controller.text = num1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.perm_device_information_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('App created by Basil')));
            },
          ),
        ],
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      controller: num1Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '',
                          hintText: ''),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text(
                      '1',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("1");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '2',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("2");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("3");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '4',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("4");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text(
                      '5',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("5");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '6',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("6");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '7',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("7");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '8',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("8");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text(
                      '9',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("9");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '0',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setNumber1("0");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '=',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      calculate("=");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text(
                      '+',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      calculate("+");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '-',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      calculate("-");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '*',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      calculate("*");
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      '/',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 89, 89),
                          fontSize: 20),
                    ),
                    onPressed: () {
                      calculate("/");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        'CE',
                        style: TextStyle(
                            color: Color.fromARGB(255, 228, 89, 89),
                            fontSize: 20),
                      ),
                      onPressed: () {
                        reset();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
