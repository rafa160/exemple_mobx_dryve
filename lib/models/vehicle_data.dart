class VehicleData {
  String id;
  String imageUrl;
  String brandName;
  String modelName;
  int modelYear;
  String fuelType;
  int mileage;
  String transmissionType;
  int price;
  int brandId;
  int colorId;

  VehicleData(
      {this.id,
        this.imageUrl,
        this.brandName,
        this.modelName,
        this.modelYear,
        this.fuelType,
        this.mileage,
        this.transmissionType,
        this.price,
        this.brandId,
        this.colorId});

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      id: json['id'],
      imageUrl: json['image_url'],
      brandName: json['brand_name'],
      modelName: json['model_name'],
      modelYear: json['model_year'],
      fuelType: json['fuel_type'],
      mileage: json['mileage'],
      transmissionType: json['transmission_type'],
      price: json['price'],
      brandId: json['brand_id'],
      colorId: json['color_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'image_url': imageUrl,
    'brand_name': brandName,
    'model_name': modelName,
    'model_year': modelYear,
    'fuel_type': fuelType,
    'mileage': mileage,
    'transmission_type': transmissionType,
    'price': price,
    'brand_id': brandId,
    'color_id': colorId
  };

  @override
  String toString() {
    return 'Vehicle{id: $id, imageUrl: $imageUrl, brandName: $brandName, modelName: $modelName, modelYear: $modelYear, fuelType: $fuelType, mileage: $mileage, transmissionType: $transmissionType, price: $price, brandId: $brandId, colorId: $colorId}';
  }
}