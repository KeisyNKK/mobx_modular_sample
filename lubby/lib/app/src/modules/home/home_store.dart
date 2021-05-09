import 'package:lubby/app/src/modules/models/client.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  var client = Client();

  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }

  // should use @computed property, but null safety problem ocurred
  bool isValid() {
    return (validateName() == null && validateEmail() == null);
  }

  @computed
  get isName {
    return validateName() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty)
      return "Campo obrigatório";
    else if (client.name.length < 3) return "Digite mais de três";

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.name.isEmpty)
      return "Campo obrigatório";
    else if (client.email.length < 3) return "Digite mais de três";

    return null;
  }
}
