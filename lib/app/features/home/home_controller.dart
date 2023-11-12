import 'package:mobx/mobx.dart';
import 'package:target_challenge/app/core/core.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final LocalStorage storage;
  HomeControllerBase({required this.storage});

  ObservableList<String> textList = ObservableList<String>();

  @action
  void addText(String text) {
    textList.add(text);
    saveTextList();
  }

  @action
  void removeText(String text) {
    textList.remove(text);
    saveTextList();
  }

  @action
  void editText(String text, int index) {
    textList.removeAt(index);
    textList.insert(index, text);
    saveTextList();
  }

  Future<void> saveTextList() async {
    await storage.save('textList', textList.nonObservableInner);
  }

  @action
  Future<void> loadTextList() async {
    final stringList = await storage.read<List<String>>('textList');
    textList.clear();
    textList.addAll(stringList ?? []);
  }
}
