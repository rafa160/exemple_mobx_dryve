import 'package:dryve_exp/mobx_stores/brand_store.dart';
import 'package:dryve_exp/service/brand_service.dart';
import 'package:dryve_exp/strings.dart';
import 'package:dryve_exp/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  BrandStore _brandStore;


  @override
  void initState() {
    super.initState();
    _brandStore = BrandStore(new BrandService());
    _brandStore.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            color: Colors.black54,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  Strings.BOTTOM_SHEET_TITLE,
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, top: 10),
                child: Text(
                  Strings.BOTTOM_SHEET_BRAND_TITLE,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                child: TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Strings.TEXT_FIELD_HINT,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),),
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_){
                    final brands = _brandStore.results?.value?.data;
                    if(brands == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (_brandStore.results.status ==
                        FutureStatus.pending) {
                      return Center(child: CircularProgressIndicator());
                    } else if (_brandStore.results?.value == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container(
                      child: ListView.builder(
                        itemCount: brands.length,
                          shrinkWrap: true,
                          itemBuilder:(BuildContext context, int index) {
                            var item = brands[index];
                            return BrandItem(
                              brandName: item.name,
                            );
                        }
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
    );
  }
}
