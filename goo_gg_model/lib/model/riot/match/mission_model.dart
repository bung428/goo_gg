class MissionModel {
  int? playerScore0;
  int? playerScore1;
  int? playerScore10;
  int? playerScore11;
  int? playerScore2;
  int? playerScore3;
  int? playerScore4;
  int? playerScore5;
  int? playerScore6;
  int? playerScore7;
  int? playerScore8;
  int? playerScore9;

  MissionModel(
      {this.playerScore0,
        this.playerScore1,
        this.playerScore10,
        this.playerScore11,
        this.playerScore2,
        this.playerScore3,
        this.playerScore4,
        this.playerScore5,
        this.playerScore6,
        this.playerScore7,
        this.playerScore8,
        this.playerScore9});

  MissionModel.fromJson(Map<String, dynamic> json) {
    playerScore0 = json['playerScore0'];
    playerScore1 = json['playerScore1'];
    playerScore10 = json['playerScore10'];
    playerScore11 = json['playerScore11'];
    playerScore2 = json['playerScore2'];
    playerScore3 = json['playerScore3'];
    playerScore4 = json['playerScore4'];
    playerScore5 = json['playerScore5'];
    playerScore6 = json['playerScore6'];
    playerScore7 = json['playerScore7'];
    playerScore8 = json['playerScore8'];
    playerScore9 = json['playerScore9'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playerScore0'] = this.playerScore0;
    data['playerScore1'] = this.playerScore1;
    data['playerScore10'] = this.playerScore10;
    data['playerScore11'] = this.playerScore11;
    data['playerScore2'] = this.playerScore2;
    data['playerScore3'] = this.playerScore3;
    data['playerScore4'] = this.playerScore4;
    data['playerScore5'] = this.playerScore5;
    data['playerScore6'] = this.playerScore6;
    data['playerScore7'] = this.playerScore7;
    data['playerScore8'] = this.playerScore8;
    data['playerScore9'] = this.playerScore9;
    return data;
  }
}