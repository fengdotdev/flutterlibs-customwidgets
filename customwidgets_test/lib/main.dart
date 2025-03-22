import 'package:customwidgets/customwidgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo CustomWidgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main View')),
      body: Center(
        child: ListView(children: [CardDynamicText(), CardLoginBox()]),
      ),
    );
  }
}

class CardDynamicText extends StatelessWidget {
  final TextEditingController controller = TextEditingController(
    text: 'this is a dynamic text',
  );
  CardDynamicText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DynamicText(
          controller: controller,
          style: TextStyle(color: Colors.blue),
        ),
        TextField(controller: controller),
      ],
    );
  }
}

class CardLoginBox extends StatelessWidget {
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController errorcontroller = TextEditingController();

  cardlogin(context) {
    final String user = usercontroller.text;
    final String  pass = passcontroller.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login $user with password $pass")),
    );
  }

  CardLoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBox(
      passwordController: passcontroller,
      userController: usercontroller,
      login: cardlogin,
      error: errorcontroller,
    );
  }
}
