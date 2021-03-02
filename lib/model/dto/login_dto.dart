class LoginDTO {
  String userName;
  String userPassword;
  String tokenAccess;
  int code;
  String msg;

  LoginDTO({
    this.userName,
    this.userPassword,
    this.tokenAccess,
    this.code,
    this.msg,
  });

  Map<String, dynamic> loginToJson() => {
        "username": userName,
        "password": userPassword,
      };

  factory LoginDTO.loginFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return LoginDTO(
        tokenAccess: json["token"]);
  }

  factory LoginDTO.loginErroFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return LoginDTO(
        code: json["code"],
        msg: json["msg"]);
  }
}
