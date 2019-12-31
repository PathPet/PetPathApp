
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petpath/vlocation.dart';
import 'clocation.dart';
import 'main.dart';

void main() => runApp(MyApp());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController _controller;

   BitmapDescriptor happyDog = BitmapDescriptor.fromAsset("assets/happy_dog_hdpi.png");
  BitmapDescriptor sadDog = BitmapDescriptor.fromAsset("assets/sad_dog_hdpi.png");
  BitmapDescriptor tmp ;





  List<Marker> allMarkers = [Marker(

          markerId: MarkerId(vetContainer[0].name),
          
          draggable: false,
          infoWindow: InfoWindow(title: vetContainer[0].name),
          position: vetContainer[0].locationCoords,
          icon:  BitmapDescriptor.fromAsset("assets/vet.png")
          
          ),

          Marker(

          markerId: MarkerId(vetContainer[1].name),
          
        
          draggable: false,
          infoWindow: InfoWindow(title: vetContainer[1].name),
          position: vetContainer[1].locationCoords, 
          icon: BitmapDescriptor.fromAsset("assets/vet.png")
          
          ),
          



          Marker(

          markerId: MarkerId(vetContainer[2].name),
          
        
          draggable: false,
          infoWindow: InfoWindow(title: vetContainer[2].name),
          position: vetContainer[2].locationCoords,
           icon: BitmapDescriptor.fromAsset("assets/vet.png")
           ),

             Marker(

          markerId: MarkerId(vetContainer[3].name),
          
             ),
         
          ];



 

  PageController _pageController;

  int prevPage;






  @override
  void initState() {
  
    super.initState();
 


    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _vetContainerList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(

          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(

                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          vetContainer[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vetContainer[index].name,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                )
                                // Text(
                                //   vetContainer[index].address,
                                //   style: TextStyle(
                                //       fontSize: 12.0,
                                //       fontWeight: FontWeight.w600),
                                // )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(39.770771, 30.517981), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 10.0,
              child: Container(
                height: 122.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: vetContainer.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _vetContainerList(index);
                  },
                ),
              ),
            )
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: vetContainer[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}