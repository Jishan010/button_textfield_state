import 'package:button_textfield_state/common/button_widget.dart';
import 'package:button_textfield_state/splash_screen.dart';
import 'package:flutter/material.dart';

import 'common/textformfield_widget.dart';

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
      home: SplashScreen(),
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

  @override
  Widget build(BuildContext context) {
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
              child: TextFormFieldWidget(
                isPassword: false,
                hintText: 'Enter your name',
                textController: myController,
                isEnable: true,
                labelText: 'Enter your name',
                errorText: isError ? "Please enter your name" : "",
                onTextChanged: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      isError = true;
                    });
                  } else {
                    setState(() {
                      isError = false;
                    });
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: ButtonWidget(
                  onTapEvent: () {
                    //show snack bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                    FocusScope.of(context).unfocus();
                  },
                  buttonText: 'Submit',
                  isEnable: myController.text.isEmpty ? false : true),
            )
          ],
        ),
      ),
    );
  }
}
