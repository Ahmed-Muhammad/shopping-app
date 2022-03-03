class SendVerifyEmailModel {
  bool? status;
  String? message;
  Data? data;

  SendVerifyEmailModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? email;

  Data.fromJson(dynamic json) {
    email = json['email'];
  }
}


