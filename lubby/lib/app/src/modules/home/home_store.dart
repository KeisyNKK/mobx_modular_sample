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
}
