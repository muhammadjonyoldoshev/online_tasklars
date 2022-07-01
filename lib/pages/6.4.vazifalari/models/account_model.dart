class Account {
  String? userName;
  String? phoneNumber;
  String? email;
  String? password;

  Account({this.userName, this.phoneNumber, this.email, this.password});

  Account.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson () => {
    'userName': userName,
    'phoneNumber': phoneNumber,
    'email': email,
    'password': password,
  };
}