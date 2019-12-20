
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petpath/clocation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Database {

  static FirebaseDatabase db = FirebaseDatabase.instance;

//  static Future<List<Food>> getFoodContainers() async{
//    List<Food> foodContainers;
//    QuerySnapshot snapshot = await col.getDocuments();
//    List<DocumentSnapshot> documents = snapshot.documents;
//    Food temp;
//    for (int i = 0; i < documents.length; i++) {
//      temp = new Food();
//      temp.name = documents[i].data['name'];
//      temp.description = documents[i].data['description'];
//      temp.address = documents[i].data['address'];
//      temp.thumbNail = documents[i].data['thumbnail'];
//      temp.locationCoords = new LatLng(documents[i].data['latitude'], documents[i].data['longitude']);
//      foodContainers.add(temp);
//    }
//    return foodContainers;
//  }

//  static Future<double> getWeight() async {
//    print("in getWeight");
//    DataSnapshot ds = await db.reference().once();
//    print("ds");
//    print(ds.value);
//    return double.parse(ds.value['weight']);
//  }

  static Future<int> getWeightByRest() async {
    http.Response response = await http.get('https://raspberrypi-1443d.firebaseio.com/sensor/loadcell/-Lvm1JIc-4NoIjDkVdqR.json');
    var responseBody = json.decode(response.body);
    var weight = responseBody['weight'];
    return weight;
  }
}

