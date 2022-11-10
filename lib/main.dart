import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//stateful widget with text field and button
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final myController = TextEditingController();

  var isError = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Color getForegroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.contains(MaterialState.disabled)) {
      return Colors.white;
    } else if (states.any(interactiveStates.contains)) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  Color getBackgroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.contains(MaterialState.disabled)) {
      return const Color(0xff97999B);
    } else if (states.any(interactiveStates.contains)) {
      return const Color(0xff004364);
    } else {
      return const Color(0xff005C8A);
    }
  }

  @override
  Widget build(BuildContext context) {
    final forgroundColor =
        MaterialStateProperty.resolveWith<Color>(getForegroundColor);

    final backgroundColor =
        MaterialStateProperty.resolveWith<Color>(getBackgroundColor);

    final buttonStyle = ButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: forgroundColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.deepPurple, width: 1.0),
                  ),
                  errorText: isError ? 'Please enter a valid text' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintText: 'Enter a search term',
                ),
                controller: myController,
                onChanged: (text) {
                  setState(() {
                    isError = text == 'Error';
                  });
                },
              ),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: myController.text.isEmpty
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                    },
              child: const Text('Print Text'),
            ),
          ],
        ),
      ),
    );
  }
}
