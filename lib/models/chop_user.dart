class ChopUser {
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  ChopUser(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.phoneNumber});
  factory ChopUser.fromFirestore(Map<String, dynamic> data) {
    return ChopUser(
        fullName: data["fullName"],
        email: data['email'],
        address: data['address'],
        phoneNumber: data['phoneNumber']);
  }
}
