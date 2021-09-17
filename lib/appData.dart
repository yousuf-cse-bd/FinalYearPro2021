import 'package:flutter/cupertino.dart';
import 'package:patienaid/address.dart';

class AppData extends ChangeNotifier{
  Address pickUpLocation, dropOffLocation;
  void updatePickUpLocationAddress(Address pickUpAddress){
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void dropOffLocationAddress(Address dropOffAddress){
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }
}