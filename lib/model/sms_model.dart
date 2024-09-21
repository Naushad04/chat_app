class SmsModel {
  String? smsId;
  String? sms;
  String? time;
  String? senderId;
  String? recieverId;
  String? status;
  String? maritalStatus;
  String? password;

  SmsModel({
    this.smsId,
    this.sms,
    this.time,
    this.senderId,
    this.recieverId,
    this.status,
    this.maritalStatus,
    this.password,
  });

  factory SmsModel.fromJson(Map<String, dynamic> json) => SmsModel(
    smsId: json["smsId"],
    sms: json["sms"],
    time: json["time"],
    senderId: json["senderId"],
    recieverId: json["recieverId"],
    status: json["status"],
    maritalStatus: json["marital status"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "smsId": smsId,
    "sms": sms,
    "time": time,
    "senderId": senderId,
    "recieverId": recieverId,
    "status": status,
    "marital status": maritalStatus,
    "password": password,
  };
}
