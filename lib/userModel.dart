class UserModel {
  final String name;
  final String department;
  final String message;

  UserModel(
      {required this.name, required this.department, required this.message});

  static final List<UserModel> dummyData = [
    UserModel(
      name: " ",
      department: " ",
      message: " ",
    )
  ];
}
