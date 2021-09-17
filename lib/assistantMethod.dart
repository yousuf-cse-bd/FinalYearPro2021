import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:patienaid/address.dart';
import 'package:patienaid/appData.dart';
import 'package:patienaid/directDetails.dart';
import 'package:patienaid/requestAssistant.dart';
import 'package:provider/provider.dart';

import 'ConfigMap.dart';

class AssistantMethod{
  static Future <String> searchCoordinateAddress(Position position, context) async{
    String placeAddress = "";
    String str1, str2, str3, str4;
    var url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$map');
    var response = await RequestAssistant.getRequest(url);
    if(response != "failed"){
      // placeAddress = response["results"][0]["formatted_address"];

      str1 = response["results"][0]["address_components"][4]["long_name"]; //house number
      str2 = response["results"][0]["address_components"][7]["long_name"]; //street number
      str3 = response["results"][0]["address_components"][6]["long_name"]; //state name
      str4 = response["results"][0]["address_components"][9]["long_name"]; //country name

      placeAddress = str1 +", "+ str2 + ", " + str3 + ", " + str4;

      Address userPickAddress = new Address();
      userPickAddress.longitude = position.longitude;
      userPickAddress.latitude = position.latitude;
      userPickAddress.placeName = placeAddress;
      
      Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickAddress);

    }
    return placeAddress;
  }

  // static Future <DirectionDetails> obtainPlaceDirectionDetails(LatLng initialPosition, LatLng finalPosition) async {
  //   String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$map";
  //   var res = await RequestAssistant.getRequest(directionUrl);
  //
  //   if(res == "failed"){
  //     return null;
  //   }
  //   DirectionDetails directionDetails = DirectionDetails();
  //
  //   directionDetails.encodePoints = res["routes"][0]["overview_polyline"]["points"];
  //
  //   directionDetails.distanceText = res["routes"][0]["legs"]["distance"]["text"];
  //   directionDetails.distanceValue = res["routes"][0]["legs"]["distance"]["value"];
  //
  //   directionDetails.durationText = res["routes"][0]["legs"]["duration"]["text"];
  //   directionDetails.durationValue = res["routes"][0]["legs"]["duration"]["value"];
  //
  //   return directionDetails;
  // }
}