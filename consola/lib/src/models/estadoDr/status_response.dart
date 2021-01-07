import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStatusResponseBloc {
  DragonFishBloc dragonFish;
  WooBloc woo;
  ActiveMQBloc activeMQ;

  GetStatusResponseBloc({this.dragonFish, this.woo, this.activeMQ});

  factory GetStatusResponseBloc.fromJson(Map<String, dynamic> json) {
    return GetStatusResponseBloc(
        dragonFish: DragonFishBloc.fromJson(json['DragonFish']),
        woo: WooBloc.fromJson(json['woo']),
        activeMQ: ActiveMQBloc.fromJson(json['ActiveMQ']));
  }
}

class DragonFishBloc {
  bool flagDragonOK;
  DragonFishBloc({this.flagDragonOK});

  factory DragonFishBloc.fromJson(Map<String, dynamic> json) {
    return DragonFishBloc(flagDragonOK: json['flagDragonOK']);
  }

  Widget dragonState() {
    final checkDragon = new DragonFishBloc();
    if (checkDragon.flagDragonOK == true) {
      return Text("OK");
    } else {
      return Text("Error");
    }
  }
}

class WooBloc {
  bool flagWooOK;
  WooBloc({this.flagWooOK});

  factory WooBloc.fromJson(Map<String, dynamic> json) {
    return WooBloc(flagWooOK: json['flagOK']);
  }
}

class ActiveMQBloc {
  bool flagActiveMQOK;
  ActiveMQBloc({this.flagActiveMQOK});

  factory ActiveMQBloc.fromJson(Map<String, dynamic> json) {
    return ActiveMQBloc(flagActiveMQOK: json['flagActiveMQOK']);
  }

  Widget activeState() {
    final checkActive = new ActiveMQBloc();
    if (checkActive.flagActiveMQOK == true) {
      return Text("OK");
    } else {
      return Text("Error");
    }
  }
}
