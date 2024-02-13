class AppValidationChecker {
  static bool isEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static bool isPassword(String password) {
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%?])[A-Za-z\d@#$!%?]{6,18}$')
        .hasMatch(password);
  }

  static bool isPasswordSame(String password, String confirmPassword) {
    return ((password == confirmPassword) &&
        (password.isNotEmpty && confirmPassword.isNotEmpty));
  }

  static bool isUsername(String username) {
    return RegExp(r'^[a-zA-Z0-9._]{6,18}$').hasMatch(username);
  }

  static bool isPhone(String phone) {
    return RegExp(r'^[+0-9]{9,15}$').hasMatch(phone);
  }

}
