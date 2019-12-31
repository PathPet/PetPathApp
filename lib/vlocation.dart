import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vet {
  String name;
  String thumbNail;
  LatLng locationCoords;

  Vet(
      {this.name,
      this.thumbNail,
      this.locationCoords});
}


final List<Vet> vetContainer = [
  Vet(
      name: '        Veteriner1',
      
    //  address: 'Yunus Emre Kampüsü',
      locationCoords: LatLng(39.791156, 30.504051),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'

      ),
  Vet(
      name: '        Veteriner2',
   //   address: 'Eskişehir Teknik Üniversitesi 2 Eylül Kampüsü',
      locationCoords: LatLng(39.815212,30.537023),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      ),
  Vet(
      name: '        Veteriner3 ',
    
      locationCoords: LatLng(39.783363,30.511082),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      ),
       Vet(
      name: '        Veteriner4 ',
    
      locationCoords: LatLng(39.783363,30.511082),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      )
];