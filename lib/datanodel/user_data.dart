class UserData {

  String firstName, lastName, phone;
  int pin, agentCode;

  UserData({
      this.firstName, this.lastName, this.phone, this.pin, this.agentCode});

  factory UserData.fromMap(Map<String, dynamic> map) {
    return new UserData(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      pin: map['pin'] as int,
      agentCode: map['agentCode'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phone': this.phone,
      'pin': this.pin,
      'agentCode': this.agentCode,
    } as Map<String, dynamic>;
  }
}