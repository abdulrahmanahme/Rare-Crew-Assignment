class MYDataModel {
  String? _type;
  String? _message;
  Data? _data;

  MYDataModel({String? type, String? message, Data? data}) {
    if (type != null) {
      _type = type;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  MYDataModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imageUrl;
  String? _address;
  String? _role;

  Data(
      {String? userId,
      String? firstName,
      String? lastName,
      String? email,
      String? imageUrl,
      String? address,
      String? role}) {
    if (userId != null) {
      _userId = userId;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (email != null) {
      _email = email;
    }
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
    if (address != null) {
      _address = address;
    }
    if (role != null) {
      _role = role;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get role => _role;
  set role(String? role) => _role = role;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['email'] = _email;
    data['imageUrl'] = _imageUrl;
    data['address'] = _address;
    data['role'] = _role;
    return data;
  }
}
