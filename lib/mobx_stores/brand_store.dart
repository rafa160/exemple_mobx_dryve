import 'package:dryve_exp/models/brand.dart';
import 'package:dryve_exp/service/brand_service.dart';
import 'package:mobx/mobx.dart';

part 'brand_store.g.dart';

class BrandStore = _BrandStore with _$BrandStore;

abstract class _BrandStore with Store {

  final BrandService _brandService;

  _BrandStore(this._brandService);

  @observable
  ObservableFuture<Brand> results = ObservableFuture.value(new Brand(data: []));

  @action
  void getBrands() {
    results = _brandService.getBrands().asObservable();
  }
}