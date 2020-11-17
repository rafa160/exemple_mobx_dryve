import 'package:dryve_exp/mobx_stores/vehicle_store.dart';
import 'package:dryve_exp/service/vehicle_service.dart';
import 'package:dryve_exp/strings.dart';
import 'package:dryve_exp/widgets/background.dart';
import 'package:dryve_exp/widgets/bottom_sheet.dart';
import 'package:dryve_exp/widgets/vehicle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VehicleStore _vehicleStore;

  @override
  void initState() {
    _vehicleStore = VehicleStore(new VehicleService());
    _vehicleStore.getVehicles();
    super.initState();
  }

  Future refresh() async {
    await Future.delayed(Duration(seconds: 2));
    _vehicleStore.getVehicles();
    return;
  }

  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black.withBlue(100),
        onRefresh: refresh,
        child: Background(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                child: AppBar(
                  leading: Image(
                    height: 5,
                    width: 5,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logo.png'),
                  ),
                  title: Text(
                    Strings.TITLE_HOME_SCREEN,
                    style: TextStyle(color: Colors.black.withBlue(100)),
                  ),
                  titleSpacing: 10,
                  centerTitle: false,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.filter_alt_rounded),
                      color: Colors.grey,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext bc) => Container(
                            height: MediaQuery.of(context).size.height * 0.90,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(10),
                                topRight: const Radius.circular(10),
                              ),
                            ),
                            child: CustomBottomSheet(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  final items = _vehicleStore.results?.value?.data;
                  if (items == null) {
                    Center(child: CircularProgressIndicator());
                  }
                  if (_vehicleStore.results.status == FutureStatus.rejected) {
                    Center(child: Text(Strings.ERROR_TITLE));
                  } else if (_vehicleStore.results.status ==
                      FutureStatus.pending) {
                    return Center(child: CircularProgressIndicator());
                  } else if (_vehicleStore.results?.value == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: GridView.builder(
                        itemCount: items?.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 20),
                        itemBuilder: (BuildContext context, int index) {
                          var item = items[index];
                          return items[index] == null
                              ? Container()
                              : VehicleCard(
                                  image: item.imageUrl,
                                  brandName: item.brandName,
                                  modelName: item.modelName,
                                  year: item.modelYear,
                                  fuelType: item.fuelType,
                                  mileage: item.mileage,
                                  transmissionType: item.transmissionType,
                                  price: item.price,
                                  onPressed: () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                  },
                                  icon: isPressed
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                );
                        }),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
