import 'package:dryve_exp/mobx_stores/brand_store.dart';
import 'package:dryve_exp/mobx_stores/color_store.dart';
import 'package:dryve_exp/service/brand_service.dart';
import 'package:dryve_exp/service/color_service.dart';
import 'package:dryve_exp/strings.dart';
import 'package:dryve_exp/widgets/brand_item.dart';
import 'package:dryve_exp/widgets/color_item.dart';
import 'package:dryve_exp/widgets/custom_buttons.dart';
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
  ColorStore _colorStore;

  @override
  void initState() {
    super.initState();
    _brandStore = BrandStore(new BrandService());
    _colorStore = ColorStore(new ColorService());
    _colorStore.getColors();
    _brandStore.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18, top: 10),
          child: Text(
            Strings.BOTTOM_SHEET_BRAND_TITLE,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: TextField(
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: Strings.TEXT_FIELD_HINT,
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              final brands = _brandStore.results?.value?.data;
              final colors = _colorStore.results?.value?.data;
              if (brands == null && colors == null) {
                return Center(child: CircularProgressIndicator());
              } else if (_brandStore.results.status == FutureStatus.pending &&
                  _colorStore.results.status == FutureStatus.pending) {
                return Center(child: CircularProgressIndicator());
              } else if (_brandStore.results?.value == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: brands.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var item = brands[index];
                            return BrandItem(
                              brandName: item.name,
                            );
                          }),
                      Padding(
                        padding: EdgeInsets.only(left: 18, right: 18, top: 10),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18, top: 20),
                        child: Text(
                          Strings.COLOR,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: colors.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3,
                                  crossAxisSpacing: 1),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var item = colors[index];
                            return ColorItem(
                              name: item.name,
                            );
                          }),
                      CustomButtons(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
