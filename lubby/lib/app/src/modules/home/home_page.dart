import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/home/stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Container(
          child: Column(
        children: [
          Observer(
            builder: (context) => Text('${store.counter}'),
          ),
          Observer(builder: (_) {
            return _textField(
                labelText: "Nome",
                onChanged: controller.client.changeName,
                errorText: controller.validateName);
          }),
          Observer(builder: (_) {
            return _textField(
                labelText: "Email",
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail);
          }),
          Observer(
              builder: (_) => ElevatedButton(
                    onPressed: controller.isValid() ? () {} : null,
                    child: Text("Go to form"),
                  ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
