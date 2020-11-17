import 'package:dryve_exp/models/color.dart';
import 'package:dryve_exp/service/color_service.dart';
import 'package:mobx/mobx.dart';

part 'color_store.g.dart';

class ColorStore = _ColorStore with _$ColorStore;

abstract class _ColorStore with Store {

  final ColorService _colorService;

  _ColorStore(this._colorService);

  @observable
  ObservableFuture<Color> results = ObservableFuture.value(new Color(data: []));


  @action
  void getColors(){
    results = _colorService.getColors().asObservable();
  }
}