

class UserModel{
String firstname;
String lastname;
String phone;
String password;

 UserModel({
   required this.firstname,
   required this.lastname,
   required this.phone,
   required this.password
});

 factory UserModel.fromJson(Map<String,Object?>json){
   return UserModel(
       firstname: json["firstname"] as String,
       lastname: json["lastname"] as String,
       phone: json["phone"] as String,
       password: json["password"] as String
   );
 }

 Map<String,String> toJson() => {
   "firstname": firstname,
   "lastname": lastname,
   "phone": phone,
   "password": password,
 };

@override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          phone == other.phone &&
          password == other.password;

  @override
  int get hashCode =>
      firstname.hashCode ^
      lastname.hashCode ^
      phone.hashCode ^
      password.hashCode;

}