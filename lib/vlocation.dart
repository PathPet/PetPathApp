import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vet {
  String name;
  String address;
  String thumbNail;
  LatLng locationCoords;

  Vet(
      {this.name,
      this.address,
      this.thumbNail,
      this.locationCoords});
}


final List<Vet> vetContainer = [
  Vet(
      name: 'Acil Veteriner Kliniği',
      address: 'Yenibağlar, Eti Cd. No: 6/b, 26120 Tepebaşı',
      locationCoords: LatLng(39.78628, 30.50720),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'

      ),
  Vet(
      name: 'Adalar Veteriner Kliniği',
      address: ' Cumhuriye, Cengiz Topel-1 Cd. No:84, 26130',
      locationCoords: LatLng(39.77971, 30.51753),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      ),
  Vet(
      name: 'Evcil Dünya Veteriner Kliniği',
     address: ' Cumhuriye, Cengiz Topel-1 Cd. No:84, 26130',
      locationCoords: LatLng(39.78077, 30.51443),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      ),
       Vet(
      name: 'Hayat Veteriner Kliniği',
     address: 'Hoşnudiye, Vural Sok. No:44, 26130 ',
      locationCoords: LatLng(39.77952, 30.51471),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      ),
       Vet(
      name: 'Gülümse Veteriner Kliniği',
     address: 'Ulusal Egemenlik Bulvarı',
      locationCoords: LatLng(39.78914, 30.45960),
      thumbNail: 'https://www.guvenlicocuk.org.tr/dosya/vnVyF.jpg'
      )


      
];