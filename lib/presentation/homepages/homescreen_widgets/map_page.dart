import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin{
 late AnimationController _animationController;
 late Animation<double> _pinanimationController;

 @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _pinanimationController = Tween<double>(begin: -100,end: 200).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         const GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target: LatLng(37.7749, -122.4194),zoom: 14),
            // onMapCreated: (controller) {
              
            // },
          ),
      
          AnimatedBuilder(animation: _pinanimationController, builder: (context, child) {
            return Positioned(
              top: _pinanimationController.value,
              left: MediaQuery.sizeOf(context).width/2-24,
              child: child!);
          },
          child:const Icon(Icons.location_pin,size: 48,color: Colors.green,),
          )
        ],
      ),
    );
  }
}