import 'package:google_maps_flutter/google_maps_flutter.dart';

class Food {
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Food(
      {this.name,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

int foodP = 10;

String foodPer = "%30";

final List<Food> foodContainer = [
  Food(
      name: '   Anadolu Üniversitesi',
      
    //  address: 'Yunus Emre Kampüsü',
      locationCoords: LatLng(39.791156, 30.504051),
      thumbNail: 'https://upload.wikimedia.org/wikipedia/commons/4/44/Anadolu_University%2C_Eski%C5%9Fehir.jpg'

      ),
  Food(
      name: 'Eskişehir Teknik Üniversitesi',
   //   address: 'Eskişehir Teknik Üniversitesi 2 Eylül Kampüsü',
      locationCoords: LatLng(39.815212,30.537023),
      thumbNail: 'https://www.eskisehirekspres.net/images/haberler/2018/08/yapilandirmada-sona-yaklasildi_5cde9.png'
      ),
  Food(
      name: 'Espark ',
      address: 'Mama oranı ' + foodPer,
      locationCoords: LatLng(39.783363,30.511082),
      thumbNail: 'https://www.espark.com.tr/fileadmin/_processed_/f/8/csm_espark__329__3100744808.jpg'
      )
];