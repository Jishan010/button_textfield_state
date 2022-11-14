import 'package:flutter/material.dart';

import 'common/common_textformfield.dart';

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
  var isEnable = true;

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
              child: CommonTextFormField(
                isPassword: false,
                hintText: 'Enter your name',
                textController: myController,
                onTextChanged: (text) {},
              ),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: myController.text.isEmpty
                  ? null
                  : () {
                      isEnable = false;
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
