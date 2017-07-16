class Address {
  String city;
  String street;
  String building;

  String get getCity => city;
  void set setCity(String city) {
    this.city = city;
  }

  String get getStreet => street;
  void set setStreet(String street) {
    this.street = street;
  }

  String get getBuilding => building;
  void set setBuilding(String building) {
    this.building = building;
  }

  Address(this.city, this.street, this.building);
}