	class GetStatusResponse {
  DragonFish dragonFish;
  Woo woo;
  ActiveMQ activeMQ;

  GetStatusResponse({this.dragonFish, this.woo, this.activeMQ});

  factory GetStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetStatusResponse(
      dragonFish: DragonFish.fromJson(json['DragonFish']),
      woo: Woo.fromJson(json['woo']),
      activeMQ: ActiveMQ.fromJson(json['ActiveMQ']));
  }
}

class DragonFish {
  bool flagDragonOK;
  DragonFish({this.flagDragonOK});

  factory DragonFish.fromJson(Map<String, dynamic> json) {
    return DragonFish(flagDragonOK: json['flagDragonOK']);
  }
}

class Woo {
  bool flagWooOK;
  Woo({this.flagWooOK});

  factory Woo.fromJson(Map<String, dynamic> json) {
    return Woo(flagWooOK: json['flagOK']);
  }
}

class ActiveMQ {
  bool flagActiveMQOK;
  ActiveMQ({this.flagActiveMQOK});

  factory ActiveMQ.fromJson(Map<String, dynamic> json) {
    return ActiveMQ(flagActiveMQOK: json['flagActiveMQOK']);
  }
}
