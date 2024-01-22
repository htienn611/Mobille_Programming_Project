
class User{
  final String phoneNumber;
  final String name;
  final bool sex;
  final String birthday;
  final String biography;
  final String password;
  final String status;

  User({required this.phoneNumber,required this.name,required this.sex,required this.birthday,required this.biography,required this.password,required this.status});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      biography: json['biography']??"",
      birthday: json['birthday']??"",
      name: json['name']??"",
      password: json['password']??"",
      phoneNumber: json['phoneNumber']??"",
      sex: json['sex']=="0"?true:false,
      status: json['status']??"",
      );
  }
}