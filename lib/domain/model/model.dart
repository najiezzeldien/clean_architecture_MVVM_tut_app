// ignore_for_file: public_member_api_docs, sort_constructors_first
class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  String id;
  String name;
  int numOfNotifications;
  Customer(
    this.id,
    this.name,
    this.numOfNotifications,
  );
}

class Contacts {
  String email;
  String phone;
  String link;
  Contacts(
    this.email,
    this.phone,
    this.link,
  );
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(
    this.customer,
    this.contacts,
  );
}

class DevicInfo {
  String name;
  String identifier;
  String version;
  DevicInfo(
    this.name,
    this.identifier,
    this.version,
  );
}

class Service {
  int id;
  String title;
  String image;
  Service(
    this.id,
    this.title,
    this.image,
  );
}

class Store {
  int id;
  String title;
  String image;
  Store(
    this.id,
    this.title,
    this.image,
  );
}

class BannerAD {
  int id;
  String title;
  String image;
  String link;
  BannerAD(
    this.id,
    this.title,
    this.image,
    this.link,
  );
}

class HomeData {
  List<Service> services;
  List<Store> stores;
  List<BannerAD> banners;
  HomeData(
    this.services,
    this.stores,
    this.banners,
  );
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}

class StoreDetails {
  int id;
  String title;
  String image;
  String details;
  String services;
  String about;

  StoreDetails(
      this.id, this.title, this.image, this.details, this.services, this.about);
}
