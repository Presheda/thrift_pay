class UserData {

  String firstname, lastname, phone;
  String pin, code;
  String dob;

  String type;

  UserData({
      this.firstname, this.lastname, this.phone, this.pin, this.code, this.dob, this.type});

  factory UserData.fromMap(Map<String, dynamic> map) {
    return new UserData(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      phone: map['phone'] as String,
      pin: map['pin'] as String,
      code: map['code'] as String,
      type: map['type'] as String,
      dob: map['dob'] as String
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstname': this.firstname,
      'lastname': this.lastname,
      'phone': this.phone,
      'pin': this.pin,
      'agent_code': this.code,
      'dob' : this.dob,
      'type' : this.type,
    } as Map<String, dynamic>;
  }
}

class AccountDetails {

   String bankNname, bankCode, vnuban;

   AccountDetails({this.bankNname, this.bankCode, this.vnuban});

   factory AccountDetails.fromMap(Map<String, dynamic> map) {
    return new AccountDetails(
      bankNname: map['bank_name'] as String,
      bankCode: map['bank_code'] as String,
      vnuban: map['vnuban'] as String,
    );
  }

   Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'bank_name': this.bankNname,
      'bank_code': this.bankCode,
      'vnuban': this.vnuban,
    } as Map<String, dynamic>;
  }
}