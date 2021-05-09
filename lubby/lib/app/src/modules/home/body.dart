import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/home/home_page.dart';
import 'package:lubby/app/src/modules/home/home_store.dart';

class BodyForm extends ModularState<HomePage, HomeStore> {
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
    return Container(
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
    ));
  }
}
