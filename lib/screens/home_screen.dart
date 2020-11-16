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
                            builder: (BuildContext bc){
                              return CustomBottomSheet();
                            }
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
                    Center(child: Text('Error'));
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
                          return VehicleCard(
                            image: item.imageUrl,
                            brandName: item.brandName,
                            modelName: item.modelName,
                            year: item.modelYear,
                            fuelType: item.fuelType,
                            mileage: item.mileage,
                            transmissionType: item.transmissionType,
                            price: item.price,
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
